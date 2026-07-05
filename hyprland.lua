-- Hyprland Lua config (converted from hyprland.conf)
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- disabled: kanshi manages monitors for now (the event hooks here loop on dms restart)
local monitors = require("scripts.monitors_layout")

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- laptop
-- hl.monitor({ output = "desc:Samsung Display Corp. 0x4164", mode = "preferred", position = "auto", scale = 2 })

-- home setup
-- hl.monitor({ output = "desc:Sceptre Tech Inc Sceptre F27 0x01010101",                        mode = "1920x1080@100", position = "0x0",    scale = 1, transform = 3 })
-- hl.monitor({ output = "desc:Philips Consumer Electronics Company PHL 271V8LB UK02439053050", mode = "1920x1080@60",  position = "1080x0", scale = 1 })
-- hl.monitor({ output = "desc:Ancor Communications Inc VG248 J5LMQS169912",                    mode = "1920x1080@60",  position = "3000x0", scale = 1 })
-- hl.monitor({ output = "desc:Samsung Display Corp. 0x4164",                                   disabled = true })

-- lab
-- hl.monitor({ output = "desc:Samsung Display Corp. 0x4164", disabled = true })
-- hl.monitor({ output = "desc:Ancor Communications Inc ASUS PB287Q 0x0001FDDD", mode = "2560x1440", position = "0x0",     scale = 1 })
-- hl.monitor({ output = "desc:Lenovo Group Limited T27h-30 V5MWX659",           mode = "2560x1440", position = "-1440x0", scale = 1, transform = 1 })

-- catch-all for random monitors
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("WLR_NO_HARDWARE_CURSORS",  "1")
hl.env("QT_QPA_PLATFORMTHEME",     "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")
hl.env("XDG_CURRENT_DESKTOP",      "Hyprland")
hl.env("XDG_SESSION_TYPE",         "wayland")
hl.env("XDG_SESSION_DESKTOP",      "Hyprland")
hl.env("HYPRCURSOR_THEME",         "Adwaita")
hl.env("HYPRCURSOR_SIZE",          "24")
hl.env("XCURSOR_SIZE",             "24")


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("kanshi -c /home/safwan/.config/kanshi/config")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1")
    hl.exec_cmd("copyq --start-server")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland.service xdg-desktop-portal.service")
    hl.exec_cmd("dms run")
    -- hl.exec_cmd("noctalia")
end)


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- hl.config({
--     general = {
--         gaps_in     = 5,
--         gaps_out    = 8,
--         border_size = 2,
--
--         col = {
--             active_border   = { colors = { "rgba(d65d0eff)", "rgba(d65d0eff)" }, angle = 0 },
--             inactive_border = "rgba(595959aa)",
--         },
--
--         layout = "scrolling",
--     },
--
--     decoration = {
--         rounding = 10,
--         rounding_power = 2,
--
--         -- Change transparency of focused and unfocused windows
--         active_opacity   = 1.0,
--         inactive_opacity = 1.0,
--
--         blur = {
--             enabled  = true,
--             size     = 6,
--             passes   = 1,
--             vibrancy = 0.1696,
--         },
--         shadow = {
--             enabled      = true,
--             range        = 4,
--             render_power = 3,
--             color        = 0xee1a1a1a,
--         },
--     },
--
--     animations = {
--         enabled = true,
--     },
-- })

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 8,
    border_size = 2,
    layout = "scrolling",
  },

  decoration = {
    rounding = 20,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
  animations = {
      enabled = true,
  },
})

-- Animation curves and animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "windows",     enabled = true, speed = 10,  bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default",  style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 10,  bezier = "easeOutQuint",  style = "slidevert" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true,
        force_split    = 2,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "slave",
        mfact      = 0.5,
        new_on_top = false,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        direction                = "right",
        explicit_column_widths   = "0.5, 1.0",
        fullscreen_on_one_column = true,
        focus_fit_method         = 1, 
        follow_focus             = true,
        follow_min_visible       =  1.0,
    },
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        disable_hyprland_logo = true,
        focus_on_activate     = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
})

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name      = "wacom-intuos-s-pen",
    transform = 0,
    output    = "desc:Ancor Communications Inc ASUS PB287Q 0x0001FDDD",
})

hl.device({
    name      = "wacom-one-by-wacom-m-pen",
    transform = 0,
    output    = "desc:Philips Consumer Electronics Company PHL 271V8LB UK02439053050",
})

-----------------
---- GESTURES ----
-----------------

-- 3 fingers up/down: change workspace (built-in 1:1 swipe)
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })

-- 3 fingers left/right: scroll through columns (scrolling layout)
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move" })

-----------------
---- BINDS ----
-----------------

hl.config({
    binds = {
        allow_workspace_cycles      = true,
        movefocus_cycles_fullscreen = true,
        disable_keybind_grabbing    = true,
    },
})


---------------
---- DEBUG ----
---------------

hl.config({
    debug = {
        enable_stdout_logs = true,
        disable_logs       = false,
    },
})


----------------------
---- LID SWITCH ----
----------------------

function disableLaptopMonitor()
    hl.exec_cmd("notify-send 'lid' 'close fired -> disabling eDP-1'")
    hl.monitor({
        output = monitors.laptopMonitor.output,
        disabled = true,
    })
end

function enableLaptopMonitor()
    hl.exec_cmd("notify-send 'lid' 'open fired -> enabling eDP-1'")
    hl.monitor(monitors.laptopMonitor)
    os.execute("hyprctl reload")
end
-- close lid
hl.bind("switch:on:Lid Switch", disableLaptopMonitor, { locked = true })
-- open lid
hl.bind("switch:off:Lid Switch", enableLaptopMonitor, { locked = true })


----------------------
---- window rules ----
----------------------
hl.window_rule({
  match = {
    class = "kitty"
  },
  opacity = "0.95 0.95",       -- "active inactive [fullscreen]"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Applications
hl.bind("ALT + RETURN",           hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + RETURN",   hl.dsp.exec_cmd("kitty"))
hl.bind("CTRL + ALT + T",         hl.dsp.exec_cmd("Thunar"))
hl.bind(mainMod .. " + m",        hl.dsp.exec_cmd("wofi --show drun"))

-- Notify focused window title
hl.bind(mainMod .. " + I",        hl.dsp.exec_cmd("notify-send 'Window title' \"$(hyprctl activewindow -j | jq -r .title)\""))
hl.bind(mainMod .. " + B",        hl.dsp.exec_cmd("pkill waybar || waybar -c /home/safwan/.config/hypr/waybar/config -s /home/safwan/.config/hypr/waybar/style.css &"))

-- Window management
hl.bind(mainMod .. " + Q",        hl.dsp.window.close())
hl.bind(mainMod .. " + V",        hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + D",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- hl.bind(mainMod .. " + E",        hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",        hl.dsp.exit())

-- Master layout messages
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.layout("swapwithmaster"))
hl.bind("SUPER + SHIFT + A",      hl.dsp.layout("addmaster"))
hl.bind("SUPER + SHIFT + R",      hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + T",        hl.dsp.layout("orientationtop"))
hl.bind("SUPER + SHIFT + T",      hl.dsp.layout("orientationleft"))

-- Move windows between monitors
hl.bind("SUPER + SHIFT + comma",  hl.dsp.window.move({ monitor = "-1" }))
hl.bind("SUPER + SHIFT + period", hl.dsp.window.move({ monitor = "+1" }))

-- Move focus with CTRL + ALT + h j k l
hl.bind("CTRL + ALT + H", hl.dsp.focus({ direction = "left"  }))
hl.bind("CTRL + ALT + L", hl.dsp.focus({ direction = "right" }))
hl.bind("CTRL + ALT + K", hl.dsp.focus({ direction = "up"    }))
hl.bind("CTRL + ALT + J", hl.dsp.focus({ direction = "down"  }))

-- Resize active window
hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({ x =  20, y =   0, relative = true })) -- right
hl.bind("SUPER + SHIFT + H", hl.dsp.window.resize({ x = -20, y =   0, relative = true })) -- left
hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({ x =   0, y = -20, relative = true })) -- up
hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({ x =   0, y =  20, relative = true })) -- down

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces on current monitor with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))

-- Switch workspaces on current monitor
hl.bind(mainMod .. " + L",    hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + H",    hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + up",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + Tab",  hl.dsp.focus({ workspace = "previous_per_monitor" }))
hl.bind(mainMod .. " + N",    hl.dsp.exec_cmd("/home/safwan/.config/hypr/empty-ws.sh"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio volume
hl.bind("CTRL + F11", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("CTRL + F12", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"))

-- Special workspace (SUPER + ALT + H toggles + moves window)
hl.bind("SUPER + ALT + H", function()
    hl.dispatch(hl.dsp.window.move({ workspace = "special" }))
    hl.dispatch(hl.dsp.workspace.toggle_special(""))
end)

-- Screenshot / lock / scripts
hl.bind("CTRL + ALT + F", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | swappy -f -'))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("hyprlock"))
-- hl.bind("CTRL + ALT + N", hl.dsp.exec_cmd("/home/safwan/.config/hypr/cycle-layout.sh"))
require("scripts.cycle_layout")
require("scripts.glass_magnifier")
require("scripts.order_workspace")
require("scripts.window_2_new_workspace")
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("/home/safwan/.config/hypr/dpms-toggle.sh"))

-- Switch layout of current workspace
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd([[hyprctl eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace -j | jq -r .id)', layout = 'master' })"]]))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd([[hyprctl eval "hl.workspace_rule({ workspace = '$(hyprctl activeworkspace -j | jq -r .id)', layout = 'scrolling' })"]]))

-- Scrolling layout messages
hl.bind(mainMod .. " + right",         hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + left",          hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + F",             hl.dsp.layout("colresize +conf"))
hl.bind("ALT + Tab",                   hl.dsp.layout("focus right"))
-- hl.bind(mainMod .. " + bracketright",  hl.dsp.layout("expel"))
-- hl.bind(mainMod .. " + bracketleft",   hl.dsp.layout("consume"))

hl.bind(mainMod .. " + bracketleft",   hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + bracketright",  hl.dsp.layout("consume_or_expel next"))

-- For Noctalia Color templates
-- require("noctalia")
--
-- Dankshell
require("dms.colors")
require("dms.windowrules")
require("dms.layout")
