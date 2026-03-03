if SERVER then
    AddCSLuaFile("includes/rotating_third_person_config.lua")
    AddCSLuaFile("includes/rotating_third_person_editor.lua")
    return -- Server doesn't need to do anything else
end

include("includes/rotating_third_person_config.lua")
include("includes/rotating_third_person_editor.lua")

-- State encapsulation
RTP = RTP or {}
RTP.State = RTP.State or {
    CameraOrigin = Vector(0,0,0),
    CameraAngles = Angle(0,0,0),
    PlayerAngles = Angle(0,0,0),
    CameraFOV = 75,
    IsAiming = false,
    AimToggleState = false,
    AimLastPressed = false,
    Initialized = false
}

local function InitState(ply)
    if not IsValid(ply) then return end
    RTP.State.CameraOrigin = ply:EyePos()
    RTP.State.CameraAngles = ply:EyeAngles()
    RTP.State.PlayerAngles = ply:EyeAngles()
    RTP.State.CameraFOV = RTP_VARS.CAM_FOV:GetInt()
    RTP.State.Initialized = true
end

local function IsAddonActive(ply)
    if not RTP_VARS.ENABLED:GetBool() then return false end
    if not IsValid(ply) or not ply:Alive() or ply:InVehicle() then return false end

    -- Smart Scope: if FOV is significantly narrowed (sniper scope), disable third person view
    if RTP_VARS.SMART_SCOPE:GetBool() and ply:GetFOV() < 50 then return false end

    return true
end

local function UpdateAimState()
    local btn = RTP_VARS.AIM_BUTTON:GetInt()
    local isDown = input.IsButtonDown(btn)

    if RTP_VARS.TOGGLE_AIM:GetBool() then
        if isDown and not RTP.State.AimLastPressed then
            RTP.State.AimToggleState = not RTP.State.AimToggleState
        end
        RTP.State.AimLastPressed = isDown
        RTP.State.IsAiming = RTP.State.AimToggleState
    else
        RTP.State.IsAiming = isDown
    end
end

-- Cache ConVars outside the hook for maximum performance
local cv_sens = GetConVar("sensitivity")
local cv_yaw = GetConVar("m_yaw")
local cv_pitch = GetConVar("m_pitch")
local cv_fov_desired = GetConVar("fov_desired")

-- Handle mouse input for camera rotation
hook.Add("InputMouseApply", "RTP.InputMouseApply", function(cmd, x, y, ang)
    local ply = LocalPlayer()
    if not IsAddonActive(ply) then return end
    if not RTP.State.Initialized then InitState(ply) return true end

    UpdateAimState()

    local invert = RTP_VARS.INVERT_Y:GetBool() and -1 or 1
    
    -- Get current player settings
    local sens = cv_sens and cv_sens:GetFloat() or 3
    local m_yaw = cv_yaw and cv_yaw:GetFloat() or 0.022
    local m_pitch = cv_pitch and cv_pitch:GetFloat() or 0.022
    local defaultFOV = cv_fov_desired and cv_fov_desired:GetFloat() or 90

    -- Correct FOV scaling relative to player settings, not a constant
    local fovScale = RTP.State.CameraFOV / defaultFOV 

    -- Calculate final deltas considering sensitivity and axis multipliers
    local deltaX = x * m_yaw * sens * fovScale
    local deltaY = y * m_pitch * sens * fovScale * invert

    RTP.State.CameraAngles.yaw = RTP.State.CameraAngles.yaw - deltaX
    RTP.State.CameraAngles.pitch = math.Clamp(RTP.State.CameraAngles.pitch + deltaY, -89, 89)

    -- If aiming, the player looks in the same direction as the camera
    if RTP.State.IsAiming then
        RTP.State.PlayerAngles = Angle(RTP.State.CameraAngles)
    end

    cmd:SetViewAngles(RTP.State.PlayerAngles)
    return true
end)

-- Create correct movement vectors for multiplayer
hook.Add("CreateMove", "RTP.CreateMove", function(cmd)
    local ply = LocalPlayer()
    if not IsAddonActive(ply) or not RTP.State.Initialized then return end

    local moveDir = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
    local isMoving = moveDir:Length2D() > 0

    if isMoving and not RTP.State.IsAiming then
        -- Calculate movement direction relative to camera angle
        local moveAng = moveDir:Angle()
        local targetYaw = RTP.State.CameraAngles.yaw + moveAng.yaw

        -- Smoothly rotate the player model towards the movement direction
        local rotSpeed = RTP_VARS.ROT_SPEED:GetInt()
        RTP.State.PlayerAngles.yaw = math.ApproachAngle(RTP.State.PlayerAngles.yaw, targetYaw, rotSpeed)

        -- Correct movement to follow the camera direction
        local fwd = RTP.State.CameraAngles:Forward()
        local right = RTP.State.CameraAngles:Right()
        fwd.z = 0 right.z = 0
        fwd:Normalize() right:Normalize()

        local inputFwd = (cmd:KeyDown(IN_FORWARD) and 1 or 0) - (cmd:KeyDown(IN_BACK) and 1 or 0)
        local inputRight = (cmd:KeyDown(IN_MOVERIGHT) and 1 or 0) - (cmd:KeyDown(IN_MOVELEFT) and 1 or 0)

        cmd:SetForwardMove(inputFwd * 400)
        cmd:SetSideMove(inputRight * 400)
    end
end)

-- Calculate camera position
hook.Add("CalcView", "RTP.CalcView", function(ply, origin, angles, fov)
    if not IsAddonActive(ply) then return end
    if not RTP.State.Initialized then InitState(ply) end

    local camFwd = RTP_VARS.CAM_FORWARD:GetInt()
    local camRight = RTP_VARS.CAM_RIGHT:GetInt()
    local camUp = RTP_VARS.CAM_UP:GetInt() + (ply:Crouching() and 20 or 0)

    -- Trace to prevent the camera from clipping through walls
    local tr = util.TraceHull({
        start = origin,
        endpos = origin - (RTP.State.CameraAngles:Forward() * camFwd)
            + (RTP.State.CameraAngles:Right() * camRight)
            + (RTP.State.CameraAngles:Up() * camUp),
        filter = ply,
        mins = Vector(-4, -4, -4),
        maxs = Vector(4, 4, 4),
        mask = MASK_SOLID_BRUSHONLY -- Ignore entities and weapons
    })

    RTP.State.CameraOrigin = tr.HitPos

    -- Dynamic FOV
    local targetFOV = RTP_VARS.CAM_FOV:GetInt() - (RTP.State.IsAiming and RTP_VARS.ZOOM_FOV:GetInt() or 0)
    RTP.State.CameraFOV = Lerp(FrameTime() * RTP_VARS.FOV_SPEED:GetInt() * 5, RTP.State.CameraFOV, targetFOV)

    return {
        origin = RTP.State.CameraOrigin,
        angles = RTP.State.CameraAngles,
        fov = RTP.State.CameraFOV,
        drawviewer = true
    }
end)

-- Rendering
hook.Add("ShouldDrawLocalPlayer", "RTP.DrawPlayer", function(ply)
    if IsAddonActive(ply) then return true end
end)

hook.Add("HUDShouldDraw", "RTP.HideCrosshair", function(name)
    if name == "CHudCrosshair" and IsAddonActive(LocalPlayer()) and
       RTP_VARS.HIDE_CROSSHAIR:GetBool() and not RTP.State.IsAiming then
        return false
    end
end)
