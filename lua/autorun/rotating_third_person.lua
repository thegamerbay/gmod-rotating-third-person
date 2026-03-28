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
    Initialized = false,
    TransitionProgress = 1
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

    -- Hybrid Mode: Switch to first person while aiming
    if RTP_VARS.SMART_SCOPE:GetBool() and RTP.State.IsAiming then return false end

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

-- Cache ConVars (retrieving yaw and pitch, but excluding sens)
local cv_yaw = GetConVar("m_yaw")
local cv_pitch = GetConVar("m_pitch")
local cv_fov_desired = GetConVar("fov_desired")

-- Handle mouse movement input
hook.Add("InputMouseApply", "RTP.InputMouseApply", function(cmd, x, y, ang)
    local ply = LocalPlayer()
    if not RTP.State.Initialized then InitState(ply) return true end

    -- Always update aiming state, even if we are temporarily in first person
    if RTP_VARS.ENABLED:GetBool() and IsValid(ply) and ply:Alive() and not ply:InVehicle() then
        UpdateAimState()
    end

    if not IsAddonActive(ply) then return end

    local multiplier = RTP_VARS.SENS_MULTIPLIER:GetFloat()
    local invert = RTP_VARS.INVERT_Y:GetBool() and -1 or 1

    -- Adjust sensitivity based on zoom level (FOV)
    local defaultFOV = cv_fov_desired and cv_fov_desired:GetFloat() or 90
    local fovScale = RTP.State.CameraFOV / defaultFOV

    -- Extract base engine multipliers for mouse
    local m_yaw = cv_yaw and cv_yaw:GetFloat() or 0.022
    local m_pitch = cv_pitch and cv_pitch:GetFloat() or 0.022

    -- WARNING: 'x' and 'y' variables are ALREADY multiplied by the player's 'sensitivity' by the engine!
    -- Therefore, we only multiply them by m_yaw/m_pitch, FOV scale, and our custom multiplier
    local deltaX = x * m_yaw * fovScale * multiplier
    local deltaY = y * m_pitch * fovScale * multiplier * invert

    -- Apply rotation (subtract deltaX to invert horizontal to match engine direction)
    RTP.State.CameraAngles.yaw = math.NormalizeAngle(RTP.State.CameraAngles.yaw - deltaX)
    RTP.State.CameraAngles.pitch = math.Clamp(RTP.State.CameraAngles.pitch + deltaY, -89, 89)

    cmd:SetViewAngles(RTP.State.PlayerAngles)
    return true
end)

-- Create correct movement vectors for multiplayer
hook.Add("CreateMove", "RTP.CreateMove", function(cmd)
    local ply = LocalPlayer()
    if not IsAddonActive(ply) or not RTP.State.Initialized then return end

    if CLIENT then
        -- Get the key name from our mod's settings (e.g. "MOUSE2" or "X")
        local aimBtn = RTP_VARS.AIM_BUTTON:GetInt()
        local aimKeyName = input.GetKeyName(aimBtn)

        -- Get the key bound to secondary attack (+attack2) in GMod (e.g. "mouse2")
        local attack2Bind = input.LookupBinding("+attack2")

        -- Compare them. string.lower is needed because functions might return different cases
        local isSameKey = false
        if aimKeyName and attack2Bind then
            isSameKey = (string.lower(aimKeyName) == string.lower(attack2Bind))
        end

        -- If it's the same key and the player is actually aiming right now - block IN_ATTACK2
        if isSameKey and RTP.State.IsAiming and cmd:KeyDown(IN_ATTACK2) then
            cmd:RemoveKey(IN_ATTACK2)
        end
    end

    if RTP.State.IsAiming then
        local aimRotSpeed = RTP_VARS.AIM_ROT_SPEED:GetInt()

        -- Smooth rotation if setting is enabled.
        -- aimRotSpeed (1 to 20) acts as tracking speed. Multiply by 0.75 to ensure 20 isn't too sharp.
        local fraction = math.Clamp(FrameTime() * aimRotSpeed * 0.75, 0.01, 0.99)
        RTP.State.PlayerAngles = LerpAngle(fraction, RTP.State.PlayerAngles, RTP.State.CameraAngles)

        cmd:SetViewAngles(RTP.State.PlayerAngles)
    end

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
    if not RTP.State.Initialized then InitState(ply) end

    -- 1. Determine target state (1 = third person, 0 = first person)
    local isActive = IsAddonActive(ply)
    local targetProgress = isActive and 1 or 0
    local transSpeed = RTP_VARS.TRANSITION_SPEED:GetFloat()
    local doSmooth = transSpeed > 0

    if not isActive and RTP.State.TransitionProgress == 0 then
        RTP.State.CameraAngles = Angle(angles.pitch, angles.yaw, angles.roll)
        RTP.State.PlayerAngles = Angle(angles.pitch, angles.yaw, angles.roll)
    end

    -- 2. Calculate transition progress
    if doSmooth then
        RTP.State.TransitionProgress = math.Approach(RTP.State.TransitionProgress, targetProgress, FrameTime() * transSpeed)
    else
        RTP.State.TransitionProgress = targetProgress
    end

    -- 3. If we are completely in first person, yield control to engine
    if RTP.State.TransitionProgress == 0 then
        return
    end

    local camFwd = RTP_VARS.CAM_FORWARD:GetInt()
    local camRight = RTP_VARS.CAM_RIGHT:GetInt()

    local targetCamUp = RTP_VARS.CAM_UP:GetInt()
    if ply:Crouching() then
        -- Subtract the positive drop value so the camera moves down relative to standing
        targetCamUp = targetCamUp - RTP_VARS.CROUCH_DROP:GetInt()
    end

    RTP.State.CurrentCamUp = RTP.State.CurrentCamUp or targetCamUp
    RTP.State.CurrentCamUp = Lerp(FrameTime() * 10, RTP.State.CurrentCamUp, targetCamUp)
    local camUp = RTP.State.CurrentCamUp

    -- Calculate base origin for the camera endpos, holding it at standing height.
    -- This counteracts the built-in engine crouch drop, moving all vertical drop logic
    -- strictly into our camUp lerping system.
    local viewZDiff = ply:GetViewOffset().z - ply:GetCurrentViewOffset().z
    local cameraBaseOrigin = origin + Vector(0, 0, viewZDiff)

    -- Trace from true player eyes (origin) to the desired camera spot
    -- to prevent starting the trace inside a ceiling on low ceiling maps.
    local tr = util.TraceHull({
        start = origin,
        endpos = cameraBaseOrigin - (RTP.State.CameraAngles:Forward() * camFwd)
            + (RTP.State.CameraAngles:Right() * camRight)
            + (RTP.State.CameraAngles:Up() * camUp),
        filter = ply,
        mins = Vector(-4, -4, -4),
        maxs = Vector(4, 4, 4),
        mask = MASK_SOLID_BRUSHONLY -- Ignore entities and weapons
    })

    RTP.State.CameraOrigin = tr.HitPos

    -- 4. POSITION INTERPOLATION (Smooth camera flight)
    -- origin is the first-person eye position
    local finalOrigin = LerpVector(RTP.State.TransitionProgress, origin, RTP.State.CameraOrigin)

    -- Dynamic FOV
    local targetFOV = RTP_VARS.CAM_FOV:GetInt() - (RTP.State.IsAiming and RTP_VARS.ZOOM_FOV:GetInt() or 0)
    RTP.State.CameraFOV = Lerp(FrameTime() * RTP_VARS.FOV_SPEED:GetInt() * 5, RTP.State.CameraFOV, targetFOV)

    -- Smoothly return FOV to standard when transitioning to first person
    local defaultFOV = ply:GetFOV() or 90
    local finalFOV = Lerp(RTP.State.TransitionProgress, defaultFOV, RTP.State.CameraFOV)

    local finalAngles = RTP.State.CameraAngles
    if not isActive then
        finalAngles = LerpAngle(RTP.State.TransitionProgress, angles, RTP.State.CameraAngles)
    end

    return {
        origin = finalOrigin,
        angles = finalAngles,
        fov = finalFOV,
        drawviewer = true
    }
end)

-- Rendering
hook.Add("ShouldDrawLocalPlayer", "RTP.DrawPlayer", function(ply)
    -- Draw the player model only if transition progress is above 15%.
    -- If the camera is too close to the eyes (transition completes), hide the model.
    if RTP.State.TransitionProgress > 0.15 then 
        return true 
    end
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

    local r = RTP_VARS.CROSSHAIR_R:GetInt()
    local g = RTP_VARS.CROSSHAIR_G:GetInt()
    local b = RTP_VARS.CROSSHAIR_B:GetInt()
    local a = RTP_VARS.CROSSHAIR_A:GetInt()
    local size = RTP_VARS.CROSSHAIR_SIZE:GetInt()

    surface.SetDrawColor(r, g, b, a)

    surface.DrawLine(pos.x - 5, pos.y, pos.x - (5 + size), pos.y)
    surface.DrawLine(pos.x + 5, pos.y, pos.x + (5 + size), pos.y)

    surface.DrawLine(pos.x, pos.y - 5, pos.x, pos.y - (5 + size))
    surface.DrawLine(pos.x, pos.y + 5, pos.x, pos.y + (5 + size))
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
