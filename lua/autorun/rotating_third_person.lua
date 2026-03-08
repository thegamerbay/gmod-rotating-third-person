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

-- Calculate FOV, other sensitivity settings are handled by the engine
local cv_fov_desired = GetConVar("fov_desired")

-- Handle mouse input for camera rotation
hook.Add("InputMouseApply", "RTP.InputMouseApply", function(cmd, x, y, ang)
    local ply = LocalPlayer()
    if not IsAddonActive(ply) then return end
    if not RTP.State.Initialized then InitState(ply) return true end

    UpdateAimState()

    local multiplier = RTP_VARS.SENS_MULTIPLIER:GetFloat()
    local invert = RTP_VARS.INVERT_Y:GetBool() and -1 or 1

    -- Correct FOV scaling relative to player settings, not a constant
    local defaultFOV = cv_fov_desired and cv_fov_desired:GetFloat() or 90
    local fovScale = RTP.State.CameraFOV / defaultFOV

    -- Extract Engine Delta
    -- The difference between where the camera was looking, and where the engine suggests looking
    -- (This delta already includes system sens, m_yaw/m_pitch and acceleration)
    local engineDeltaYaw = math.AngleDifference(ang.yaw, cmd:GetViewAngles().yaw)
    local engineDeltaPitch = math.AngleDifference(ang.pitch, cmd:GetViewAngles().pitch)

    -- Apply FOV scale, player multiplier, and inversion
    local finalDeltaYaw = engineDeltaYaw * fovScale * multiplier
    local finalDeltaPitch = engineDeltaPitch * fovScale * multiplier * invert

    -- Offset current camera rotation with the delta
    RTP.State.CameraAngles.yaw = math.NormalizeAngle(RTP.State.CameraAngles.yaw + finalDeltaYaw)
    RTP.State.CameraAngles.pitch = math.Clamp(RTP.State.CameraAngles.pitch + finalDeltaPitch, -89, 89)

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

    -- Important: Invert SideMove. In GMod +SideMove is right,
    -- but for the Angle() method a positive Y is left.
    local moveDir = Vector(cmd:GetForwardMove(), -cmd:GetSideMove(), 0)
    local isMoving = moveDir:Length2D() > 0

    -- Classic Mode Override: When classic movement is enabled, the player model
    -- should always aim exactly where the camera is looking.
    if RTP_VARS.DISABLE_ROT_WHEN_MOVE:GetBool() and not RTP.State.IsAiming then
        local rotSpeed = RTP_VARS.ROT_SPEED:GetInt()
        RTP.State.PlayerAngles.yaw = math.ApproachAngle(
            RTP.State.PlayerAngles.yaw, RTP.State.CameraAngles.yaw, rotSpeed
        )
        RTP.State.PlayerAngles.pitch = RTP.State.CameraAngles.pitch

        -- Movement works normally without manual overrides in classic mode
        return
    end

    if isMoving and not RTP.State.IsAiming then
        -- Calculate target movement angle relative to the camera
        local moveAng = moveDir:Angle()
        local targetYaw = math.NormalizeAngle(RTP.State.CameraAngles.yaw + moveAng.yaw)

        -- Smoothly rotate the player model
        local rotSpeed = RTP_VARS.ROT_SPEED:GetInt()
        RTP.State.PlayerAngles.yaw = math.ApproachAngle(RTP.State.PlayerAngles.yaw, targetYaw, rotSpeed)

        -- Convert desired movement from world coordinates
        -- to local coordinates of the current model rotation.
        local speed = moveDir:Length2D()
        local diffYaw = math.rad(targetYaw - RTP.State.PlayerAngles.yaw)

        cmd:SetForwardMove(math.cos(diffYaw) * speed)
        cmd:SetSideMove(-math.sin(diffYaw) * speed)
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

-- Function to draw custom crosshair
local function DrawTraceCrossHair()
    local ply = LocalPlayer()

    local traceData = {
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 9000,
        filter = ply
    }

    local trace = util.TraceLine(traceData)
    local pos = trace.HitPos:ToScreen()

    surface.SetDrawColor(255, 230, 0, 240)

    surface.DrawLine(pos.x - 5, pos.y, pos.x - 8, pos.y)
    surface.DrawLine(pos.x + 5, pos.y, pos.x + 8, pos.y)

    surface.DrawLine(pos.x, pos.y - 5, pos.x, pos.y - 8)
    surface.DrawLine(pos.x, pos.y + 5, pos.x, pos.y + 8)
end

-- Hook to disable standard crosshair
hook.Add("HUDShouldDraw", "RTP.HideCrosshair", function(name)
    if name == "CHudCrosshair" and IsAddonActive(LocalPlayer()) then
        -- Hide standard crosshair if custom trace is enabled
        if RTP_VARS.TRACE_CROSSHAIR:GetBool() then
            return false
        end
        -- Or if the setting to hide crosshair outside aiming is enabled
        if RTP_VARS.HIDE_CROSSHAIR:GetBool() and not RTP.State.IsAiming then
            return false
        end
    end
end)

-- Hook to draw our custom crosshair
hook.Add("HUDPaint", "RTP.DrawCustomCrosshair", function()
    if IsAddonActive(LocalPlayer()) and RTP_VARS.TRACE_CROSSHAIR:GetBool() then
        -- Check if crosshair should be hidden outside aiming mode
        local isHideCrosshair = RTP_VARS.HIDE_CROSSHAIR:GetBool()

        if not isHideCrosshair or RTP.State.IsAiming then
            DrawTraceCrossHair()
        end
    end
end)
