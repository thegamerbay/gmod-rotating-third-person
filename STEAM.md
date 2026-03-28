[h1]Third Person Rotating Camera[/h1]
[b]A highly customizable over-the-shoulder camera for Garry's Mod, inspired by Haydee.[/b]

[h2]📖 Overview[/h2]
The Third Person Rotating Camera is a Garry's Mod addon that completely overhauls the game's default third-person perspective. Designed identically after the camera mechanics from the game Haydee, this mod aims to deliver a precise, responsive, and highly customizable over-the-shoulder camera system. Whether you're engaging in sandbox play or exploring maps, this addon offers unparalleled control over your viewing angles to maximize your gameplay experience.

[h2]✨ Features[/h2]
[list]
[*] [b]True Aim-to-Look Mechanics:[/b] Your player model dynamically adjusts and looks exactly where you are aiming.
[*] [b]Aiming Rotation Smoothness:[/b] Configure exactly how smoothly your character turns their body to meet the camera when aiming weapon mechanics.
[*] [b]Precise Multiplayer Prediction:[/b] No more rubberbanding or "auto-walking"! The movement is perfectly synced and calculated relative to the camera's angle.
[*] [b]Hybrid Mode (Smart Scope):[/b] Play alongside weapon bases like TFA or CW 2.0 without conflict. The camera seamlessly auto-transitions to first-person when you try to aim.
[*] [b]Classic Movement Mode:[/b] Prefer standard Garry's Mod controls? Enable the Classic mode setting to lock your player model to the camera direction while retaining the over-the-shoulder view.
[*] [b]Toggle Aim:[/b] Prefer not to hold the aim button? Enable Toggle Aim in the settings for single-click aiming.
[*] [b]Invert Y-Axis Support:[/b] Built-in axis inversion for players who prefer traditional flight-stick style pitch control.
[*] [b]Camera Sensitivity:[/b] Tune your over-the-shoulder look speed with a dedicated multiplier setting to compensate for the third-person parallax effect.
[*] [b]Shoulder Switching:[/b] Quickly swap your camera from the right shoulder to the left shoulder with a single command.
[*] [b]Dynamic Crosshair Tracing:[/b] Enable the true trajectory crosshair to see exactly where your bullets will land in 3D space. Fully customizable size and color!
[*] [b]Crouch Camera Drop:[/b] Maintain complete control when crouching! Customize exactly how much the camera lowers to keep your view unobstructed in tight spaces.
[*] [b]Extensive Customization:[/b] Manage your camera's X, Y, and Z offsets, FOV, and speeds seamlessly via the Garry's Mod Context Menu.
[*] [b]Full Localization Support (31 Languages):[/b] Enjoy high-quality native UI translations and context-aware help tooltips for every setting.
[/list]

[h2]🎮 How to Use[/h2]
[h3]In-Game Menu[/h3]
Customize the camera in real-time without typing any commands!
[list]
[*] [b]1.[/b] Hold [b]C[/b] to open the Garry's Mod Context Menu.
[*] [b]2.[/b] Click on the [b]Third Person Rotating Camera[/b] icon (usually located on the top bar or under a dedicated tab).
[*] [b]3.[/b] Adjust the sliders for Camera Distance, Up/Down, Right/Left, and FOV.
[*] [b]4.[/b] Set your preferred Aiming button (default is Right Mouse Button - 108).
[*] [b]5.[/b] Enable or disable new features like Toggle Aim, Hybrid Mode (Smart Scope), Classic movement, and Invert Y-Axis directly via checkboxes.
[/list]

[h3]Quick Keybinds[/h3]
You can bind useful functions directly in the developer console (~):
[code]
// Toggle the third-person camera ON and OFF with a single key (e.g., 'X')
bind x "rtp_toggle"

// Quickly swap shoulders (moves camera from right to left, or vice versa)
bind v "rtp_switch_shoulder"
[/code]

[h2]⚙️ ConVar Configuration[/h2]
For server owners or power users, all variables can be configured via the console:
[list]
[*] [b]rtp_enabled[/b] - Toggles the addon on (1) or off (0). Default: 1
[*] [b]rtp_camera_forward[/b] - Controls the camera's distance from the player. Default: 50
[*] [b]rtp_camera_right[/b] - Controls the camera's horizontal offset. Default: 20
[*] [b]rtp_camera_up[/b] - Controls the camera's vertical offset. Default: -10
[*] [b]rtp_camera_crouch_drop[/b] - How much the camera lowers when crouching. (0 = no drop). Default: 20
[*] [b]rtp_camera_fov[/b] - Sets the target Field of View for the camera. Default: 75
[*] [b]rtp_camera_zoom_fov[/b] - How much FOV to subtract when aiming. Default: 15
[*] [b]rtp_camera_sens_multiplier[/b] - Multiplier for camera rotation speed. Default: 1.0
[*] [b]rtp_player_rotation_speed[/b] - Controls how fast the player model turns to match movement. Default: 5
[*] [b]rtp_aim_rotation_speed[/b] - Smoothness of character rotation while aiming (1 = slow, 20 = responsive). Default: 10
[*] [b]rtp_player_aiming_button[/b] - Mouse/Keyboard keycode for the aim button. Default: 108
[*] [b]rtp_toggle_aim[/b] - If 1, clicking the aim button toggles the aiming state. Default: 0
[*] [b]rtp_smart_scope[/b] - Automatically switches to first-person view while you are aiming (Hybrid mode). Default: 0
[*] [b]rtp_invert_y[/b] - Inverts the vertical mouse pitch rotation. Default: 0
[*] [b]rtp_crosshair_hidden_if_not_aiming[/b] - Hides the default crosshair while not aiming. Default: 0
[*] [b]rtp_classic_movement_mode[/b] - Enables Classic movement mode: locks model rotation to camera direction. Default: 0
[*] [b]rtp_crosshair_trace_position[/b] - Draws a custom dynamic crosshair showing true bullet trajectory. Default: 0
[*] [b]rtp_crosshair_size[/b] - Adjusts the size of the custom crosshair. Default: 3
[*] [b]rtp_crosshair_r/g/b/a[/b] - Adjusts the color (RGBA) of the custom crosshair. Default: 255/230/0/240
[/list]

Pictured PM: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=744357881]Haydee [P.M][/url]

Source code: [url=https://github.com/thegamerbay/gmod-rotating-third-person]GitHub[/url]
