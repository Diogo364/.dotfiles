import os.path as osp

from libqtile.config import Drag, Key, KeyChord
from libqtile.lazy import lazy
from utils import CustomContext


def set_keybindings(custom_context: CustomContext):
    keys = []
    mod = custom_context.mod_key

    # navigation
    keys.extend(
        [
            # Switch between windows
            Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
            Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
            Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
            Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
            Key(
                ["mod1"],
                "Tab",
                lazy.group.next_window(),
                desc="Move focus to next window",
            ),
            Key(
                [mod],
                "Tab",
                lazy.screen.toggle_group(),
                desc="Move focus to next group",
            ),
            Key(
                [mod],
                "comma",
                lazy.prev_screen(),
                desc="Move focus to previous monitor",
            ),
        ]
    )

    # moving_windows
    keys.extend(
        [
            Key(
                [mod, "shift"],
                "h",
                lazy.layout.shuffle_left().when(layout=["columns"]),
                lazy.layout.swap_left().when(layout=["monadtall"]),
                desc="Move window to the left",
            ),
            Key(
                [mod, "shift"],
                "j",
                lazy.layout.shuffle_down().when(layout=["columns", "monadtall"]),
                lazy.layout.move_down().when(layout=["treetab"]),
                desc="Move window down",
            ),
            Key(
                [mod, "shift"],
                "k",
                lazy.layout.shuffle_up().when(layout=["columns", "monadtall"]),
                lazy.layout.move_up().when(layout=["treetab"]),
                desc="Move window up",
            ),
            Key(
                [mod, "shift"],
                "l",
                lazy.layout.shuffle_right().when(layout=["columns"]),
                lazy.layout.swap_right().when(layout=["monadtall"]),
                desc="Move window to the right",
            ),
        ]
    )

    # resize_mode
    keys.extend(
        [
            KeyChord(
                [mod],
                "r",
                [
                    Key(
                        [],
                        "h",
                        lazy.layout.grow_left().when(layout=["bsp", "columns"]),
                        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
                        desc="Grow window to the left",
                    ),
                    Key(
                        [],
                        "l",
                        lazy.layout.grow_right().when(layout=["bsp", "columns"]),
                        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
                        desc="Grow window to the right",
                    ),
                    Key(
                        [],
                        "j",
                        lazy.layout.grow_down(),
                        desc="Grow window down",
                    ),
                    Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
                ],
                mode=True,
                name="Resize",
            )
        ]
    )

    # utility_keys
    keys.extend(
        [
            Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
            # This is similar to i3 stack mode
            Key(
                [mod],
                "s",
                lazy.layout.toggle_split(),
                desc="Toggle between split and unsplit sides of stack",
            ),
            Key(
                [mod],
                "f",
                lazy.window.toggle_fullscreen(),
                desc="Toggle fullscreen on the focused window",
            ),
            Key(
                [mod, "shift"],
                "p",
                lazy.spawn(osp.join(custom_context.qtile_path, "autorun.sh")),
                desc="Reload Configuration Script",
            ),
            Key(
                [mod, "shift"],
                "r",
                lazy.reload_config(),
                desc="Reload qtile config",
            ),
            Key(
                [mod],
                "d",
                lazy.spawn(custom_context.apps_dict["launcher_cmd"]),
                desc="Run launcher",
            ),
            Key(
                [mod, "shift"],
                "d",
                lazy.spawn(custom_context.apps_dict["complete_launcher_cmd"]),
                desc="Run launcher strong",
            ),
            Key(
                [mod, "shift"],
                "f",
                lazy.spawn(custom_context.apps_dict["file_fuzzy_finder"]),
                desc="Run launcher strong",
            ),
            Key(["mod1"], "F4", lazy.window.kill(), desc="Kill focused window"),
            Key(
                [mod, "shift"],
                "space",
                lazy.window.toggle_floating(),
                desc="Toggle floating on the focused window",
            ),
            Key(
                [mod],
                "y",
                lazy.spawn("yank -a"),
                desc="Yank selection to Clipboard App",
            ),
            Key(
                [mod, "control"],
                "y",
                lazy.spawn("yank -x"),
                desc="Clean Clipboard History",
            ),
            Key(
                [mod, "shift"],
                "y",
                lazy.spawn("yank -s"),
                desc="Show Clipboard History in selection menu",
            ),
            Key(
                [mod],
                "Escape",
                lazy.spawn("custom-exit"),
                desc="Open exit menu",
            ),
            Key(
                [mod],
                "Return",
                lazy.spawn(custom_context.apps_dict["terminal"]),
                desc="Launch terminal",
            ),
            Key(
                [mod, "shift"],
                "Return",
                lazy.spawncmd(),
                desc="Spawn command using prompt widget",
            ),
            # Toggle between different layouts as defined below
            Key([mod], "m", lazy.next_layout(), desc="Toggle between layouts"),
            Key([mod, "shift"], "m", lazy.prev_layout(), desc="Toggle between layouts"),
            Key(
                [mod, "shift"],
                "b",
                lazy.spawn("rofi-bluetooth"),
                desc="Rofi Interface for bluetooth connection",
            ),
        ]
    )

    # launcher_mode
    keys.extend(
        [
            KeyChord(
                [mod],
                "x",
                [
                    Key([], "b", lazy.spawn(custom_context.apps_dict["browser"])),
                    Key(
                        [],
                        "t",
                        lazy.spawn(custom_context.apps_dict["kitty_ssh_specific"]),
                    ),
                    Key([], "s", lazy.spawn(custom_context.apps_dict["slack"])),
                    Key([], "p", lazy.spawn(custom_context.apps_dict["pulse"])),
                    Key([], "f", lazy.spawn(custom_context.apps_dict["file_manager"])),
                    Key([], "i", lazy.spawn(custom_context.apps_dict["pritunl"])),
                    Key([], "c", lazy.spawn(custom_context.apps_dict["calendar"])),
                ],
                mode=False,
                name="Launcher",
            ),
        ],
    )

    # Volume Control
    keys.extend(
        [
            Key(
                [],
                "XF86AudioRaiseVolume",
                lazy.spawn(custom_context.apps_dict["raise_volume"]),
                desc="Raise Volume",
            ),
            Key(
                [],
                "XF86AudioLowerVolume",
                lazy.spawn(custom_context.apps_dict["lower_volume"]),
                desc="Lower Volume%",
            ),
            Key(
                [],
                "XF86AudioMute",
                lazy.spawn(custom_context.apps_dict["mute_volume"]),
                desc="Mute/Unmute Volume",
            ),
        ]
    )

    # Player Controls
    keys.extend(
        [
            Key(
                [],
                "XF86AudioPlay",
                lazy.spawn(custom_context.apps_dict["play_pause_ctl"]),
                desc="Toggle PlayPause",
            ),
            Key(
                [],
                "XF86AudioNext",
                lazy.spawn(custom_context.apps_dict["next_song"]),
                desc="Go to Next",
            ),
            Key(
                [],
                "XF86AudioPrev",
                lazy.spawn(custom_context.apps_dict["previous_song"]),
                desc="Go to Previous",
            ),
        ]
    )

    # Media Mode
    keys.extend(
        [
            KeyChord(
                [mod, "shift"],
                "m",
                [
                    Key(
                        [],
                        "k",
                        lazy.spawn(custom_context.apps_dict["raise_volume"]),
                        desc="Raise Volume%",
                    ),
                    Key(
                        [],
                        "j",
                        lazy.spawn(custom_context.apps_dict["lower_volume"]),
                        desc="Lower Volume%",
                    ),
                    Key(
                        [],
                        "m",
                        lazy.spawn(custom_context.apps_dict["mute_volume"]),
                        desc="Mute/Unmute Volume",
                    ),
                    Key(
                        [],
                        "p",
                        lazy.spawn(custom_context.apps_dict["play_pause_ctl"]),
                        desc="Toggle PlayPouse",
                    ),
                    Key(
                        [],
                        "l",
                        lazy.spawn(custom_context.apps_dict["next_song"]),
                        desc="Go to Next",
                    ),
                    Key(
                        [],
                        "h",
                        lazy.spawn(custom_context.apps_dict["previous_song"]),
                        desc="Go to Previous",
                    ),
                ],
                mode=True,
                name="Music: Previous(h) Play/Pause(p) Next(l) // Volume: Increase(k) Decrease(k) Mute(m)",
            )
        ]
    )

    # Screen Brightness
    keys.extend(
        [
            Key(
                [],
                "XF86MonBrightnessDown",
                lazy.spawn("xbacklight -dec 20"),
                desc="Decrease screen brightness",
            ),
            Key(
                [],
                "XF86MonBrightnessUp",
                lazy.spawn("xbacklight -inc 20"),
                desc="Increase screen brightness",
            ),
        ]
    )

    # Screenshot Control
    keys.extend(
        [
            Key(
                [mod],
                "F2",
                lazy.spawn(
                    "maim --select \"/home/$USER/Pictures/Screenshots/$(date '+%Y-%m-%d %H-%M-%S').png\"",
                    shell=True,
                ),
                desc="Take iterative screenshot active window to screenshot folder",
            ),
            Key(
                [mod, "shift"],
                "F2",
                lazy.spawn(
                    "maim --select | xclip -selection clipboard -t image/png",
                    shell=True,
                ),
                desc="Take iterative screenshot to clipboard",
            ),
            Key(
                [mod],
                "F3",
                lazy.spawn(
                    "maim -u --window $(xdotool getactivewindow) \"/home/$USER/Pictures/Screenshots/$(date '+%Y-%m-%d %H-%M-%S').png\"",
                    shell=True,
                ),
                desc="Take screenshot from window to screenshot folder",
            ),
            Key(
                [mod, "shift"],
                "F3",
                lazy.spawn(
                    "maim -u --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png",
                    shell=True,
                ),
                desc="Take screenshot from window to clipboard",
            ),
            Key(
                [mod],
                "F1",
                lazy.spawn("print-tesseract", shell=True),
                desc="OCR from screenshot",
            ),
        ]
    )

    return keys


def set_mouse_shortcuts(custom_context: CustomContext):
    mod = custom_context.mod_key
    return [
        Drag(
            [mod],
            "Button1",
            lazy.window.set_position_floating(),
            start=lazy.window.get_position(),
        ),
        Drag(
            [mod, "shift"],
            "Button1",
            lazy.window.set_size_floating(),
            start=lazy.window.get_size(),
        ),
    ]
