hl.monitor({
    output = "DP-1",
    mode = "2560x1440@165",
    position = "auto",
    scale = "auto",
})

-- local menu = "rofi -show drun -disable-history -show-icons -sort -sorting-method fzf"

-- autoexec
hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "arch- kbuildsycoca6")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = "rgba(89b4faee)",
            inactive_border = "rgba(313244ee)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        no_focus_fallback = true,
    },

    ecosystem = {
        no_donation_nag = true,
    },

    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },

    dwindle = {
        preserve_split = true,
        permanent_direction_override = true,
    },

    decoration = {
        rounding = 15,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            vibrancy = 0.1696,
            ignore_opacity = true,
        },
    },

    animations = {
        enabled = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    input = {
        kb_layout = "us,us",
        kb_variant = ",intl",
        kb_model = "",
        kb_options = "grp:win_space_toggle, compose:rctrl",
        kb_rules = "",
        follow_mouse = 1,
        numlock_by_default = true,
        sensitivity = 0,
        repeat_rate = 40,
        repeat_delay = 300,
    },
})

require("hyprland-binds")
require("hyprland-windowrules")
require("hyprland-animations")
