require("busted.runner")()
local spy = require("luassert.spy")

describe("Rotating Third Person Configs", function()

    before_each(function()
        -- Reset global mock spies
        require("spec.helpers.gmod_mocks")
    end)

    it("should register all RTP_VARS", function()
        -- Load file
        dofile("lua/includes/rotating_third_person_config.lua")

        -- Check existence and defaults
        assert.is_not_nil(RTP_VARS)
        assert.is_true(RTP_VARS.ENABLED:GetBool())
        assert.are.equal(50, RTP_VARS.CAM_FORWARD:GetInt())
        assert.are.equal(20, RTP_VARS.CAM_RIGHT:GetInt())
        assert.are.equal(-10, RTP_VARS.CAM_UP:GetInt())
        assert.are.equal(75, RTP_VARS.CAM_FOV:GetInt())
        assert.are.equal(1.0, RTP_VARS.SENS_MULTIPLIER:GetFloat())
        assert.is_true(RTP_VARS.SMART_SCOPE:GetBool())
        assert.are.equal(50, RTP_VARS.SMART_SCOPE_THRESHOLD:GetInt())
        assert.are.equal(15, RTP_VARS.ZOOM_FOV:GetInt())
        assert.is_false(RTP_VARS.DISABLE_ROT_WHEN_MOVE:GetBool())
        assert.is_true(RTP_VARS.TRACE_CROSSHAIR:GetBool())
    end)

    it("should register rtp_toggle command", function()
        dofile("lua/includes/rotating_third_person_config.lua")
        assert.is_not_nil(concommand["rtp_toggle"])

        -- Default enabled to disabled
        concommand.rtp_toggle()
        assert.spy(_G.RunConsoleCommand).was.called_with("rtp_enabled", "0")
        assert.spy(_G.surface.PlaySound).was.called()

        -- Disabled to enabled
        _G.RunConsoleCommand:clear()
        RTP_VARS.ENABLED.value = "0"
        concommand.rtp_toggle()
        assert.spy(_G.RunConsoleCommand).was.called_with("rtp_enabled", "1")
    end)

    it("should register rtp_switch_shoulder command", function()
        dofile("lua/includes/rotating_third_person_config.lua")
        assert.is_not_nil(concommand["rtp_switch_shoulder"])

        -- Switch to left
        RTP_VARS.CAM_RIGHT.value = "20"
        concommand.rtp_switch_shoulder()
        assert.spy(_G.RunConsoleCommand).was.called_with("rtp_camera_right", "-20")

        -- Switch to right
        _G.RunConsoleCommand:clear()
        RTP_VARS.CAM_RIGHT.value = "-20"
        concommand.rtp_switch_shoulder()
        assert.spy(_G.RunConsoleCommand).was.called_with("rtp_camera_right", "20")
    end)
end)
