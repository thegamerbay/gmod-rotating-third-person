RTP_VARS = {
    ENABLED = CreateClientConVar("rtp_enabled", "1", true, false),
    CAM_FORWARD = CreateClientConVar("rtp_camera_forward", "50", true, false),
    CAM_RIGHT = CreateClientConVar("rtp_camera_right", "20", true, false),
    CAM_UP = CreateClientConVar("rtp_camera_up", "-10", true, false),
    CAM_FOV = CreateClientConVar("rtp_camera_fov", "75", true, false),
    FOV_SPEED = CreateClientConVar("rtp_camera_fov_change_speed", "2", true, false),
    ROT_SPEED = CreateClientConVar("rtp_player_rotation_speed", "5", true, false),
    AIM_BUTTON = CreateClientConVar("rtp_player_aiming_button", "108", true, false),
    HIDE_CROSSHAIR = CreateClientConVar("rtp_crosshair_hidden_if_not_aiming", "0", true, false),
    INVERT_Y = CreateClientConVar("rtp_invert_y", "0", true, false),
    TOGGLE_AIM = CreateClientConVar("rtp_toggle_aim", "0", true, false),
    SMART_SCOPE = CreateClientConVar("rtp_smart_scope", "1", true, false, "Auto-disable in sniper scopes"),
    ZOOM_FOV = CreateClientConVar("rtp_camera_zoom_fov", "15", true, false),
    DISABLE_ROT_WHEN_MOVE = CreateClientConVar("rtp_classic_movement_mode", "0", true, false),
    TRACE_CROSSHAIR = CreateClientConVar("rtp_crosshair_trace_position", "0", true, false)
}

-- Convenient command for binding (bind x rtp_toggle)
concommand.Add("rtp_toggle", function()
    local current = RTP_VARS.ENABLED:GetBool()
    RunConsoleCommand("rtp_enabled", current and "0" or "1")
    surface.PlaySound("garrysmod/ui_click.wav")
end)

-- Command to switch shoulder
concommand.Add("rtp_switch_shoulder", function()
    local current = RTP_VARS.CAM_RIGHT:GetInt()
    RunConsoleCommand("rtp_camera_right", tostring(-current))
end)