from dataclasses import dataclass, field
from logging import Logger
from typing import Dict

from colors import ColorScheme, List, Optional
from libqtile.config import Key


@dataclass
class CustomContext:
    mod_key: str
    apps_dict: Dict[str, str]
    qtile_path: str
    assets_path: str
    colorschemes: Dict[str, ColorScheme]
    chosen_colorscheme: str
    logger: Logger
    keys: Optional[List[Key]] = field(default=None)

    def __post_init__(self):
        self.current_colorscheme = self.colorschemes[self.chosen_colorscheme]


default_apps = dict(
    terminal="kitty",
    slack="slack",
    browser="brave-browser",
    pbrowser='brave-browser --profile-directory="Default"',
    ibrowser='brave-browser --profile-directory="Profile 2"',
    mbrowser='brave-browser --profile-directory="Profile 1"',
    launcher_cmd="rofi -show drun",
    file_fuzzy_finder="rofi -show filebrowser",
    complete_launcher_cmd='rofi -run-list-command ". ~/.local/bin/list-alias" -run-command "/bin/zsh -i -c \'{cmd}\'" -show',
    pulse="/opt/pulsesecure/bin/pulseUI",
    file_manager="nautilus",
    pritunl="pritunl-client-electron",
    calendar="gnome-calendar",
    kitty_ssh_specific='kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes',
    raise_volume="pactl set-sink-volume @DEFAULT_SINK@ +2%",
    lower_volume="pactl set-sink-volume @DEFAULT_SINK@ -2%",
    mute_volume="pactl set-sink-mute @DEFAULT_SINK@ toggle",
    play_pause_ctl="playerctl play-pause",
    next_song="playerctl next",
    previous_song="playerctl previous",
)


def set_default_layouts_config(border_focus):
    return {
        "border_focus": border_focus,
        "border_on_single": True,
        "border_width": 5,
        "margin": 5,
        "insert_position": 8,
    }
