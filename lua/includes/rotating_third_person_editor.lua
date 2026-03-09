local PANEL_WIDTH = 350
local PANEL_HEIGHT = 550
local PANEL_TITLE = "Third Person Rotating Camera"
local ELEMENTS_HEIGHT = 30

local Editor = {}

local function BoolToInt( bool )
    if bool then
        return 1
    else
        return 0
    end
end

local function getNewElementYOffset()
    local newOffset = Editor.newElementYOffset
    Editor.newElementYOffset = newOffset + ELEMENTS_HEIGHT
    return newOffset
end

local CustomTooltip = {}
function CustomTooltip:PositionTooltip()
    if not IsValid(self.TargetPanel) then
        self:Remove()
        return
    end
    self:PerformLayout()

    local x, y = gui.MousePos()
    local w, h = self:GetSize()

    x = x + 15
    y = y + 15

    if x + w > ScrW() then x = ScrW() - w end
    if y + h > ScrH() then y = ScrH() - h end
    if x < 0 then x = 0 end
    if y < 0 then y = 0 end

    self:SetPos( x, y )
end
vgui.Register( "rtp_custom_tooltip", CustomTooltip, "DTooltip" )

local function AddHelpIcon( parent, x, y, tooltipKey )
    if not tooltipKey then return end

    local icon = parent:Add( "DImage" )
    icon:SetPos( x, y )
    icon:SetSize( 16, 16 )
    icon:SetImage( "icon16/help.png" )
    icon:SetTooltip( language.GetPhrase( tooltipKey ) )
    icon:SetTooltipPanelOverride( "rtp_custom_tooltip" )
    icon:SetMouseInputEnabled( true ) -- Required so DImage can trigger tooltips

    return icon
end

local function DrawPanel( window )
    Editor.enableToggle = RTP_VARS.ENABLED:GetBool() or false
    Editor.newElementYOffset = 0

    if Editor.PANEL ~= nil then
        Editor.PANEL:Remove()
    end

    if window == nil then
        window = vgui.Create( "DFrame" )
        window:SetSize( PANEL_WIDTH, PANEL_HEIGHT )
        window:SetTitle( PANEL_TITLE )
        window:SetVisible( true )
        window:SetDraggable( true )
        window:ShowCloseButton( true )
        window:MakePopup()
    end

    Editor.PANEL = window
    Editor.PANEL:SetPos( ScrW() - PANEL_WIDTH - 10, 40 )
end

local function DrawSheet()
    Editor.PANEL.Sheet = Editor.PANEL:Add( "DPropertySheet" )
    Editor.PANEL.Sheet:Dock( LEFT )
    Editor.PANEL.Sheet:SetSize( PANEL_WIDTH - 10, 0 )
    Editor.PANEL.Sheet:SetPos( 5, 0 )

    Editor.PANEL.Settings = Editor.PANEL.Sheet:Add( "DPanelSelect" )
    Editor.PANEL.Sheet:AddSheet( "Settings", Editor.PANEL.Settings, "icon16/cog_edit.png" )
end

local function UpdateEnableButton()
    if Editor.enableToggle then
        Editor.PANEL.EnableThird:SetText( language.GetPhrase( "rtp_ui_disable_btn" ) )
        Editor.PANEL.EnableThird:SetTextColor( Color( 150, 0, 0) )
    else
        Editor.PANEL.EnableThird:SetText( language.GetPhrase( "rtp_ui_enable_btn" ) )
        Editor.PANEL.EnableThird:SetTextColor( Color( 0, 150 ,0 ) )
    end
end

local function DrawEnableButton()
    Editor.PANEL.EnableThird = Editor.PANEL.Settings:Add( "DButton" )
    Editor.PANEL.EnableThird:SizeToContents()
    Editor.PANEL.EnableThird:SetPos( 10, getNewElementYOffset() + 3 )
    Editor.PANEL.EnableThird:SetSize( 300, 20 )

    UpdateEnableButton()
    Editor.PANEL.EnableThird.DoClick = function()
        Editor.enableToggle = not Editor.enableToggle
        RunConsoleCommand( "rtp_enabled", BoolToInt( Editor.enableToggle ) )
        UpdateEnableButton()
    end
end

local function addScratchLabel( text, offset )
    local label = Editor.PANEL.Settings:Add( "DLabel" )
    label:SetPos( 10, offset + 5 )
    label:SetText( text )
    label:SizeToContents()
    return label
end

local function addScratchTextEntry( value, offset )
    local textEntry = Editor.PANEL.Settings:Add( "DTextEntry" )
    textEntry:SetPos( 160 , offset )
    textEntry:SetValue( value )
    textEntry:SetSize( 40, 20 )
    textEntry:SetNumeric( true )
    textEntry:SetUpdateOnType( true )
    return textEntry
end

local function addNumberScratch( min, max, value, offset )
    local numberScratch = Editor.PANEL.Settings:Add( "DNumberScratch" )
    numberScratch:SetPos( 205, offset + 2 )
    numberScratch:SetValue( value )
    numberScratch:SetMin( min )
    numberScratch:SetMax( max )
    numberScratch:SetDecimals( 0 )
    return numberScratch
end

local function DrawScratchBlock( labelKey, min, max, variable, tooltipKey )
    local yOffset = getNewElementYOffset()
    local value = GetConVar( variable ):GetInt()

    local label = addScratchLabel( language.GetPhrase( labelKey ), yOffset )
    local textEntry = addScratchTextEntry( value, yOffset )
    local numberScratch = addNumberScratch( min, max, value, yOffset )

    AddHelpIcon( Editor.PANEL.Settings, 305, yOffset + 4, tooltipKey )

    textEntry.OnTextChanged = function()
        local newValue = textEntry:GetValue()
        numberScratch:SetValue( newValue )
        RunConsoleCommand( variable, newValue )
    end

    numberScratch.OnValueChanged = function()
        local newValue = numberScratch:GetTextValue()
        textEntry:SetValue( newValue )
        RunConsoleCommand( variable, newValue )
    end

    return {
        label = label,
        textEntry = textEntry,
        numberScratch = numberScratch
    }
end

local function DrawDistanceSettings()
    Editor.PANEL.CamDistance = DrawScratchBlock(
        "rtp_ui_cam_distance", 0, 1000, "rtp_camera_forward", "rtp_tip_cam_distance"
    )
end

local function DrawUpSettings()
    Editor.PANEL.CamUp = DrawScratchBlock( "rtp_ui_cam_up", -50, 50, "rtp_camera_up", "rtp_tip_cam_up" )
end

local function DrawRightSettings()
    Editor.PANEL.CamRight = DrawScratchBlock( "rtp_ui_cam_right", -100, 100, "rtp_camera_right", "rtp_tip_cam_right" )
end

local function DrawFovSettings()
    Editor.PANEL.CamFov = DrawScratchBlock( "rtp_ui_cam_fov", 30, 110, "rtp_camera_fov", "rtp_tip_cam_fov" )
end

local function DrawZoomFovSettings()
    Editor.PANEL.ZoomFov = DrawScratchBlock( "rtp_ui_zoom_fov", 0, 90, "rtp_camera_zoom_fov", "rtp_tip_zoom_fov" )
end

local function DrawSensSettings()
    Editor.PANEL.SensMult = DrawScratchBlock(
        "rtp_ui_sens_mult", 0.1, 2.0, "rtp_camera_sens_multiplier", "rtp_tip_sens_mult"
    )

    -- Override for float logic
    local currentVal = GetConVar("rtp_camera_sens_multiplier"):GetFloat()
    Editor.PANEL.SensMult.numberScratch:SetDecimals( 2 )
    Editor.PANEL.SensMult.numberScratch:SetValue( currentVal )
    Editor.PANEL.SensMult.textEntry:SetValue( currentVal )
end

local function DrawAimingBinder()
    local offset = getNewElementYOffset()

    local label = Editor.PANEL.Settings:Add( "DLabel" )
    label:SetPos( 10, offset + 5 )
    label:SetText( language.GetPhrase( "rtp_ui_aiming_btn" ) )
    label:SizeToContents()

    Editor.PANEL.AimingBinder = Editor.PANEL.Settings:Add( "DBinder" )
    Editor.PANEL.AimingBinder:SetPos( 160, offset + 3 )
    Editor.PANEL.AimingBinder:SetSize( 140, 20 )
    Editor.PANEL.AimingBinder:SetConVar( "rtp_player_aiming_button" )
    Editor.PANEL.AimingBinder:SetValue( GetConVar( "rtp_player_aiming_button" ):GetInt() )

    AddHelpIcon( Editor.PANEL.Settings, 305, offset + 5, "rtp_tip_aiming_btn" )
end

local function DrawSmartScopeThresholdSettings()
    Editor.PANEL.SmartScopeThreshold = DrawScratchBlock(
        "rtp_ui_smart_scope_threshold",
        10, 110,
        "rtp_smart_scope_threshold",
        "rtp_tip_smart_scope_threshold"
    )
end

local function ResetSettings()
    RunConsoleCommand( "rtp_enabled", "1" )

    RunConsoleCommand( "rtp_camera_forward", "50" )
    Editor.PANEL.CamDistance.textEntry:SetValue( 50 )
    Editor.PANEL.CamDistance.textEntry.OnTextChanged()

    RunConsoleCommand( "rtp_camera_right", "20" )
    Editor.PANEL.CamRight.textEntry:SetValue( 20 )
    Editor.PANEL.CamRight.textEntry.OnTextChanged()

    RunConsoleCommand( "rtp_camera_up", "-10" )
    Editor.PANEL.CamUp.textEntry:SetValue( -10 )
    Editor.PANEL.CamUp.textEntry.OnTextChanged()

    RunConsoleCommand( "rtp_camera_fov", "75" )
    Editor.PANEL.CamFov.textEntry:SetValue( 75 )
    Editor.PANEL.CamFov.textEntry.OnTextChanged()

    RunConsoleCommand( "rtp_camera_zoom_fov", "15" )
    if Editor.PANEL.ZoomFov then
        Editor.PANEL.ZoomFov.textEntry:SetValue( 15 )
        Editor.PANEL.ZoomFov.textEntry.OnTextChanged()
    end

    RunConsoleCommand( "rtp_camera_sens_multiplier", "1" )
    if Editor.PANEL.SensMult then
        Editor.PANEL.SensMult.textEntry:SetValue( 1 )
        Editor.PANEL.SensMult.numberScratch:SetValue( 1 )
    end

    RunConsoleCommand( "rtp_camera_fov_change_speed", "2" )
    RunConsoleCommand( "rtp_player_rotation_speed", "5" )

    RunConsoleCommand( "rtp_player_aiming_button", "108" )
    Editor.PANEL.AimingBinder:SetValue( 108 )

    RunConsoleCommand( "rtp_crosshair_hidden_if_not_aiming", "0" )
    Editor.PANEL.IsCrosshairHiddenIfNotAiming:SetValue( false )

    RunConsoleCommand( "rtp_crosshair_trace_position", "1" )
    if Editor.PANEL.IsTraceCrosshairPosition then
        Editor.PANEL.IsTraceCrosshairPosition:SetValue( true )
    end

    -- New variables
    RunConsoleCommand( "rtp_toggle_aim", "0" )
    Editor.PANEL.IsToggleAim:SetValue( false )

    RunConsoleCommand( "rtp_smart_scope", "1" )
    Editor.PANEL.IsSmartScope:SetValue( true )

    RunConsoleCommand( "rtp_smart_scope_threshold", "50" )
    if Editor.PANEL.SmartScopeThreshold then
        Editor.PANEL.SmartScopeThreshold.textEntry:SetValue( 50 )
        Editor.PANEL.SmartScopeThreshold.numberScratch:SetValue( 50 )
    end

    RunConsoleCommand( "rtp_invert_y", "0" )
    Editor.PANEL.IsInvertY:SetValue( false )

    RunConsoleCommand( "rtp_classic_movement_mode", "0" )
    if Editor.PANEL.IsDisableRotWhenMove then
        Editor.PANEL.IsDisableRotWhenMove:SetValue( false )
    end
end

local function DrawResetButton()
    Editor.PANEL.ResetButton= Editor.PANEL.Settings:Add( "DButton" )
    Editor.PANEL.ResetButton:SizeToContents()

    Editor.PANEL.ResetButton:SetPos( 10, getNewElementYOffset() + 3 )
    Editor.PANEL.ResetButton:SetSize( 300, 20 )

    Editor.PANEL.ResetButton:SetText( language.GetPhrase( "rtp_ui_reset_btn" ) )
    Editor.PANEL.ResetButton:SetTextColor( Color( 150, 0, 0) )

    Editor.PANEL.ResetButton.DoClick = function()
        ResetSettings()
    end
end

local function DrawCheckBox( labelKey, variable, tooltipKey )
    local yOffset = getNewElementYOffset()

    local checkBox = Editor.PANEL.Settings:Add( "DCheckBoxLabel" )
    checkBox:SetPos( 8, yOffset + 6 )
    checkBox:SetText( language.GetPhrase( labelKey ) )
    checkBox:SetConVar( variable )
    checkBox:SetValue( GetConVar( variable ):GetBool() )

    if tooltipKey then
        AddHelpIcon( Editor.PANEL.Settings, 305, yOffset + 6, tooltipKey )
        checkBox:SetTooltip( language.GetPhrase( tooltipKey ) )
        checkBox:SetTooltipPanelOverride( "rtp_custom_tooltip" )
    end

    return checkBox
end

local function DrawCheckboxes()
    Editor.PANEL.IsCrosshairHiddenIfNotAiming = DrawCheckBox(
        "rtp_ui_hide_crosshair", "rtp_crosshair_hidden_if_not_aiming", "rtp_tip_hide_crosshair"
    )
    Editor.PANEL.IsTraceCrosshairPosition = DrawCheckBox(
        "rtp_ui_trace_crosshair", "rtp_crosshair_trace_position", "rtp_tip_trace_crosshair"
    )
    Editor.PANEL.IsToggleAim = DrawCheckBox(
        "rtp_ui_toggle_aim", "rtp_toggle_aim", "rtp_tip_toggle_aim"
    )
    Editor.PANEL.IsSmartScope = DrawCheckBox(
        "rtp_ui_smart_scope", "rtp_smart_scope", "rtp_tip_smart_scope"
    )
    Editor.PANEL.IsInvertY = DrawCheckBox(
        "rtp_ui_invert_y", "rtp_invert_y", "rtp_tip_invert_y"
    )
    Editor.PANEL.IsDisableRotWhenMove = DrawCheckBox(
        "rtp_ui_classic_mode", "rtp_classic_movement_mode", "rtp_tip_classic_mode"
    )
end

local function DrawEditor( window )
    DrawPanel( window )
    DrawSheet()

    DrawEnableButton()
    DrawDistanceSettings()
    DrawUpSettings()
    DrawRightSettings()
    DrawFovSettings()
    DrawZoomFovSettings()
    DrawSensSettings()
    DrawAimingBinder()
    DrawSmartScopeThresholdSettings()
    DrawCheckboxes()
    DrawResetButton()
end

list.Set( "DesktopWindows", "RotatingThirdPerson", {
    title = PANEL_TITLE,
    icon = "icon64/rotating_third_person.png",
    width = PANEL_WIDTH,
    height = PANEL_HEIGHT,
    onewindow = true,
    init = function( icon, window )
        DrawEditor( window )
    end
} )
