require("busted.runner")()
local spy = require("luassert.spy")

describe("Rotating Third Person Autorun Logic", function()

    local hooks = {}

    before_each(function()
        -- Reload mocks clean
        require("spec.helpers.gmod_mocks")

        -- Intercept hook.Add to test our functions directly
        _G.hook.Add = spy.new(function(event, name, callback)
            hooks[event] = callback
        end)

        -- Clear RTP global
        _G.RTP = nil

        -- Load config manually since include is mocked
        dofile("lua/includes/rotating_third_person_config.lua")

        -- Load the main file bypassing SERVER checks
        _G.SERVER = false
        dofile("lua/autorun/rotating_third_person.lua")

        -- Start with Addon Enabled
        _G.RTP_VARS.ENABLED.value = "1"
        _G.RTP_VARS.TRANSITION_SPEED.value = "0"
    end)

    it("should initialize state on first CalcView", function()
        assert.is_false(RTP.State.Initialized)

        -- Call CalcView
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90)

        assert.is_true(RTP.State.Initialized)
        assert.are.equal(75, RTP.State.CameraFOV)
    end)

    it("should auto-disable third person when aiming (Hybrid Mode)", function()
        -- Load smart scope
        _G.RTP_VARS.SMART_SCOPE.value = "1"
        local ply = LocalPlayer()

        -- Simulate aiming
        RTP.State.IsAiming = true

        local view = hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90)

        -- If it returns nil, the hook yielded to first person
        assert.is_nil(view)

        -- Simulate not aiming
        RTP.State.IsAiming = false

        local view2 = hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90)

        -- Should return view
        assert.is_not_nil(view2)
    end)

    it("should apply mouse rotation to camera", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        local cmd = {
            SetViewAngles = spy.new(function() end),
            GetViewAngles = function() return Angle(0,0,0) end
        }

        -- Move mouse right and down.
        hooks["InputMouseApply"](cmd, 100, 50, Angle(0, 0, 0))

        -- Pitch should clamp between -89 and 89
        assert.is_true(RTP.State.CameraAngles.pitch > 0)
        assert.is_true(RTP.State.CameraAngles.yaw < 0)
    end)

    it("should support invert Y axis", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.INVERT_Y.value = "1"

        local cmd = {
            SetViewAngles = spy.new(function() end),
            GetViewAngles = function() return Angle(0,0,0) end
        }

        local startPitch = RTP.State.CameraAngles.pitch
        -- Move mouse down (50)
        hooks["InputMouseApply"](cmd, 0, 50, Angle(0, 0, 0))

        -- Pitch should decrease due to inversion
        assert.is_true(RTP.State.CameraAngles.pitch < startPitch)
    end)

    it("should scale mouse input according to player ConVar settings", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        -- Force known starting angles and FOV
        RTP.State.CameraAngles = Angle(0, 0, 0)
        RTP.State.CameraFOV = 90

        local cmd = {
            SetViewAngles = spy.new(function() end),
            GetViewAngles = function() return Angle(0,0,0) end
        }

        _G.RTP_VARS.SENS_MULTIPLIER.value = "2.0"

        -- With mouse x=100, y=100
        -- deltaX = 100 * 0.022 (m_yaw) * 2.0 (mult) * 1 (fovScale) = 4.4
        -- deltaY = 100 * 0.022 (m_pitch) * 2.0 (mult) * 1 (fovScale) = 4.4
        hooks["InputMouseApply"](cmd, 100, 100, Angle(0, 0, 0))

        assert.is_true(math.abs(RTP.State.CameraAngles.yaw - (-4.4)) < 0.01)
        assert.is_true(math.abs(RTP.State.CameraAngles.pitch - 4.4) < 0.01)
    end)

    it("should correct movement vectors during CreateMove", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        local cmd = {
            GetForwardMove = function() return 400 end,
            GetSideMove = function() return 0 end,
            SetForwardMove = spy.new(function() end),
            SetSideMove = spy.new(function() end),
            KeyDown = function() return false end
        }

        RTP.State.CameraAngles = Angle(0, 90, 0) -- Looking right

        hooks["CreateMove"](cmd)

        assert.spy(cmd.SetForwardMove).was.called()
        assert.spy(cmd.SetSideMove).was.called()
    end)

    it("should smoothly rotate player model towards camera when aiming", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.AIM_ROT_SPEED.value = "10"
        RTP.State.IsAiming = true

        local cmd = {
            GetForwardMove = function() return 0 end,
            GetSideMove = function() return 0 end,
            SetForwardMove = spy.new(function() end),
            SetSideMove = spy.new(function() end),
            KeyDown = function() return false end,
            SetViewAngles = spy.new(function() end)
        }

        RTP.State.CameraAngles = Angle(0, 90, 0)
        RTP.State.PlayerAngles = Angle(0, 0, 0)

        hooks["CreateMove"](cmd)

        -- 0.016 * 10 * 0.75 = 0.12 (12%)
        -- 12% of 90 degrees = 10.8 degrees
        assert.is_true(RTP.State.PlayerAngles.yaw > 10.7)
        assert.is_true(RTP.State.PlayerAngles.yaw < 10.9)
        assert.spy(cmd.SetViewAngles).was.called_with(cmd, RTP.State.PlayerAngles)
    end)

    it("should block IN_ATTACK2 when aim button and +attack2 bind are the same", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.AIM_BUTTON.value = "108" -- Mock returns MOUSE2
        _G.IN_ATTACK2 = 2048
        RTP.State.IsAiming = true

        _G.input.LookupBinding = function(bind) return bind == "+attack2" and "mouse2" or nil end

        local cmd = {
            GetForwardMove = function() return 0 end,
            GetSideMove = function() return 0 end,
            SetForwardMove = spy.new(function() end),
            SetSideMove = spy.new(function() end),
            KeyDown = spy.new(function(self, key) return key == _G.IN_ATTACK2 end),
            RemoveKey = spy.new(function() end),
            SetViewAngles = spy.new(function() end)
        }

        hooks["CreateMove"](cmd)

        assert.spy(cmd.RemoveKey).was.called_with(cmd, _G.IN_ATTACK2)
    end)

    it("should NOT block IN_ATTACK2 when aim button and +attack2 bind are different", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.AIM_BUTTON.value = "108" -- Mock returns MOUSE2
        _G.IN_ATTACK2 = 2048
        RTP.State.IsAiming = true

        _G.input.LookupBinding = function(bind) return bind == "+attack2" and "z" or nil end

        local cmd = {
            GetForwardMove = function() return 0 end,
            GetSideMove = function() return 0 end,
            SetForwardMove = spy.new(function() end),
            SetSideMove = spy.new(function() end),
            KeyDown = spy.new(function(self, key) return key == _G.IN_ATTACK2 end),
            RemoveKey = spy.new(function() end),
            SetViewAngles = spy.new(function() end)
        }

        hooks["CreateMove"](cmd)

        assert.spy(cmd.RemoveKey).was_not.called()
    end)

    it("should match pitch and yaw to camera angles in classic movement mode", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.DISABLE_ROT_WHEN_MOVE.value = "1"

        local cmd = {
            GetForwardMove = function() return 400 end,
            GetSideMove = function() return 0 end,
            SetForwardMove = spy.new(function() end),
            SetSideMove = spy.new(function() end),
            KeyDown = function() return false end
        }

        RTP.State.CameraAngles = Angle(45, 90, 0) -- Pitch 45, Yaw 90
        RTP.State.PlayerAngles = Angle(0, 0, 0)

        hooks["CreateMove"](cmd)

        assert.are.equal(45, RTP.State.PlayerAngles.pitch)
        -- Not asserting Sets since they are skipped in classic mode
    end)

    it("should apply FOV zoom when aiming", function()
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90) -- init

        _G.RTP_VARS.CAM_FOV.value = "90"
        _G.RTP_VARS.ZOOM_FOV.value = "20"

        -- Enable aim
        RTP.State.IsAiming = true

        hooks["CalcView"](ply, Vector(0,0,0), Angle(0,0,0), 90)

        -- Target FOV should be 90 - 20 = 70.
        -- Due to lerp, we just check if CameraFOV decreased below the 90 start
        assert.is_true(RTP.State.CameraFOV < 90)
    end)

    it("should hide default crosshair when trace crosshair is enabled", function()
        _G.RTP_VARS.TRACE_CROSSHAIR.value = "1"

        local shouldDraw = hooks["HUDShouldDraw"]("CHudCrosshair")
        assert.is_false(shouldDraw)
    end)

    it("should hide default crosshair when trace is disabled but hide setting is active outside of aiming", function()
        _G.RTP_VARS.TRACE_CROSSHAIR.value = "0"
        _G.RTP_VARS.HIDE_CROSSHAIR.value = "1"
        RTP.State.IsAiming = false

        local shouldDraw = hooks["HUDShouldDraw"]("CHudCrosshair")
        assert.is_false(shouldDraw)
    end)

    it("should draw custom trace crosshair when enabled", function()
        _G.RTP_VARS.TRACE_CROSSHAIR.value = "1"
        _G.RTP_VARS.HIDE_CROSSHAIR.value = "0"

        _G.surface = _G.surface or {}
        _G.surface.SetDrawColor = spy.new(function() end)
        _G.surface.DrawLine = spy.new(function() end)

        _G.util = _G.util or {}
        _G.util.TraceLine = function()
            return { HitPos = { ToScreen = function() return {x=100, y=100} end } }
        end

        local ply = LocalPlayer()
        ply.GetShootPos = function() return Vector(0,0,0) end
        ply.GetAimVector = function() return Vector(1,0,0) end

        hooks["HUDPaint"]()

        assert.spy(_G.surface.SetDrawColor).was.called_with(255, 230, 0, 240)
        assert.spy(_G.surface.DrawLine).was.called(4)
    end)

    it("should drop camera height by CROUCH_DROP relative to standing base when crouching", function()
        local ply = LocalPlayer()
        ply.Crouching = function() return true end
        ply.GetCurrentViewOffset = function() return Vector(0, 0, 28) end -- dropped eye height

        _G.RTP_VARS.CAM_FORWARD.value = "0"
        _G.RTP_VARS.CAM_RIGHT.value = "0"
        _G.RTP_VARS.CAM_UP.value = "0"
        _G.RTP_VARS.CROUCH_DROP.value = "20"

        RTP.State.CurrentCamUp = 0
        RTP.State.CameraAngles = Angle(0,0,0)

        local view = hooks["CalcView"](ply, Vector(0,0,28), Angle(0,0,0), 90)

        -- Base origin should be corrected to 64, then it should lerp down from 0 to -20
        -- New camUp after 1 frame (~0.16 lerp factor) is around -3.2
        -- 64 + (-3.2) = 60.8
        assert.is_true(view.origin.z < 64)
        assert.is_true(view.origin.z > 28)
    end)

    it("should smoothly transition camera origin and FOV when TRANSITION_SPEED > 0", function()
        -- Init completely
        local ply = LocalPlayer()
        hooks["CalcView"](ply, Vector(0,0,64), Angle(0,0,0), 90)

        -- Enable smoothing by setting speed > 0
        _G.RTP_VARS.TRANSITION_SPEED.value = "2.0"


        -- Default starts at Progress 1 (Fully third person)
        assert.are.equal(1, RTP.State.TransitionProgress)

        -- Change state to inactive to trigger transition to first person
        _G.RTP_VARS.ENABLED.value = "0"

        -- Run one frame
        local view = hooks["CalcView"](ply, Vector(0,0,64), Angle(0,0,0), 90)

        -- 1.0 - (0.016 * 2.0) = 0.968
        assert.is_true(RTP.State.TransitionProgress < 1.0)
        assert.is_true(RTP.State.TransitionProgress > 0.0)
        assert.is_not_nil(view)


        -- Origin and fov should be interpolated
        assert.is_true(view.fov > 75)
        assert.is_true(view.fov < 90)


        -- Angle should also be interpolated properly
        assert.is_not_nil(view.angles)
    end)
end)
