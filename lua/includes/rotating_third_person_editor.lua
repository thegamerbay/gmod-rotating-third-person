local PANEL_WIDTH = 300
local PANEL_HEIGHT = 500
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
        Editor.PANEL.EnableThird:SetText( "Disable Third Person" )
        Editor.PANEL.EnableThird:SetTextColor( Color( 150, 0, 0) )
    else
        Editor.PANEL.EnableThird:SetText( "Enable Third Person" )
        Editor.PANEL.EnableThird:SetTextColor( Color( 0, 150 ,0 ) )
    end
end

local function DrawEnableButton()
    Editor.PANEL.EnableThird = Editor.PANEL.Settings:Add( "DButton" )
    Editor.PANEL.EnableThird:SizeToContents()
    Editor.PANEL.EnableThird:SetPos( 10, getNewElementYOffset() + 3 )
    Editor.PANEL.EnableThird:SetSize( 250, 20 )

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
    textEntry:SetPos( 110 , offset )
    textEntry:SetValue( value )
    textEntry:SetSize( 40, 20 )
    textEntry:SetNumeric( true )
    textEntry:SetUpdateOnType( true )
    return textEntry
end

local function addNumberScratch( min, max, value, offset )
    local numberScratch = Editor.PANEL.Settings:Add( "DNumberScratch" )
    numberScratch:SetPos( 155, offset + 2 )
    numberScratch:SetValue( value )
    numberScratch:SetMin( min )
    numberScratch:SetMax( max )
    numberScratch:SetDecimals( 0 )
    return numberScratch
end

local function DrawScratchBlock( labelText, min, max, variable )
    local yOffset = getNewElementYOffset()
    local value = GetConVar( variable ):GetInt()

    local label = addScratchLabel( labelText, yOffset )
    local textEntry = addScratchTextEntry( value, yOffset )
    local numberScratch = addNumberScratch( min, max, value, yOffset )

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
    Editor.PANEL.CamDistance = DrawScratchBlock( "Camera Distance: ", 0, 1000, "rtp_camera_forward" )
end

local function DrawUpSettings()
    Editor.PANEL.CamUp = DrawScratchBlock( "Camera Up: ", -50, 50, "rtp_camera_up" )
end

local function DrawRightSettings()
    Editor.PANEL.CamRight = DrawScratchBlock( "Camera Right: ", -100, 100, "rtp_camera_right" )
end

local function DrawFovSettings()
    Editor.PANEL.CamFov = DrawScratchBlock( "Camera FOV: ", 30, 110, "rtp_camera_fov" )
end

local function DrawZoomFovSettings()
    Editor.PANEL.ZoomFov = DrawScratchBlock( "Zoom FOV Amount: ", 0, 90, "rtp_camera_zoom_fov" )
end

local function DrawAimingBinder()
    local offset = getNewElementYOffset()

    local label = Editor.PANEL.Settings:Add( "DLabel" )
    label:SetPos( 10, offset + 5 )
    label:SetText( 'Aiming button: ' )
    label:SizeToContents()

    Editor.PANEL.AimingBinder = Editor.PANEL.Settings:Add( "DBinder" )
    Editor.PANEL.AimingBinder:SetPos( 110, offset + 3 )
    Editor.PANEL.AimingBinder:SetSize( 150, 20 )
    Editor.PANEL.AimingBinder:SetConVar( "rtp_player_aiming_button" )
    Editor.PANEL.AimingBinder:SetValue( GetConVar( "rtp_player_aiming_button" ):GetInt() )
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

    RunConsoleCommand( "rtp_camera_fov_change_speed", "2" )
    RunConsoleCommand( "rtp_player_rotation_speed", "5" )

    RunConsoleCommand( "rtp_player_aiming_button", "108" )
    Editor.PANEL.AimingBinder:SetValue( 108 )

    RunConsoleCommand( "rtp_crosshair_hidden_if_not_aiming", "0" )
    Editor.PANEL.IsCrosshairHiddenIfNotAiming:SetValue( false )

    RunConsoleCommand( "rtp_crosshair_trace_position", "0" )
    if Editor.PANEL.IsTraceCrosshairPosition then
        Editor.PANEL.IsTraceCrosshairPosition:SetValue( false )
    end

    -- New vars
    RunConsoleCommand( "rtp_toggle_aim", "0" )
    Editor.PANEL.IsToggleAim:SetValue( false )

    RunConsoleCommand( "rtp_smart_scope", "1" )
    Editor.PANEL.IsSmartScope:SetValue( true )

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
    Editor.PANEL.ResetButton:SetSize( 250, 20 )

    Editor.PANEL.ResetButton:SetText( "Reset Settings" )
    Editor.PANEL.ResetButton:SetTextColor( Color( 150, 0, 0) )

    Editor.PANEL.ResetButton.DoClick = function()
        ResetSettings()
    end
end

local function DrawCheckBox( labelText, variable )
    local checkBox = Editor.PANEL.Settings:Add( "DCheckBoxLabel" )
    checkBox:SetPos( 8, getNewElementYOffset() + 6 )
    checkBox:SetText( labelText )
    checkBox:SetConVar( variable )
    checkBox:SetValue( GetConVar( variable ):GetBool() )

    return checkBox
end

local function DrawCheckboxes()
    Editor.PANEL.IsCrosshairHiddenIfNotAiming = DrawCheckBox(
        "Hide crosshair if not aiming", "rtp_crosshair_hidden_if_not_aiming"
    )
    Editor.PANEL.IsTraceCrosshairPosition = DrawCheckBox(
        "Trace crosshair position", "rtp_crosshair_trace_position"
    )
    Editor.PANEL.IsToggleAim = DrawCheckBox( "Toggle Aim", "rtp_toggle_aim" )
    Editor.PANEL.IsSmartScope = DrawCheckBox( "Smart Scope (disable in sniper)", "rtp_smart_scope" )
    Editor.PANEL.IsInvertY = DrawCheckBox( "Invert Y-Axis", "rtp_invert_y" )
    Editor.PANEL.IsDisableRotWhenMove = DrawCheckBox(
        "Classic movement mode (fixed to camera)", "rtp_classic_movement_mode"
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
    DrawAimingBinder()
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
