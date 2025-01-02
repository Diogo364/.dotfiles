import os.path as osp
import subprocess

from colors import extract_colors_from_yaml
from groups import set_groups
from keybindings import set_keybindings, set_mouse_shortcuts
from layouts import set_floating, set_layouts
from libqtile import hook
from libqtile.log_utils import logger
from screen_setup import set_screen
from utils import *

ASSETS_PATH = osp.expanduser("~/.config/qtile/assets/")
colors_yaml_path = osp.join(ASSETS_PATH, "colorschemes.yaml")

mod = "mod4"

global_context = CustomContext(
    mod_key=mod,
    apps_dict=default_apps,
    qtile_path=osp.expanduser("~/.config/qtile"),
    assets_path=ASSETS_PATH,
    colorschemes=extract_colors_from_yaml(colors_yaml_path, key="colorscheme"),
    chosen_colorscheme="custom",
    logger=logger,
)


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"


global_context.logger.debug(f"Setting Layouts")
layouts = set_layouts(global_context)

global_context.logger.debug(f"Setting Keybindings")
keys = set_keybindings(global_context)
global_context.keys = keys

global_context.logger.debug(f"Setting Groups")
groups = set_groups(global_context)

global_context.logger.debug(f"Setting Screens")
screens = set_screen(global_context)

global_context.logger.debug(f"Setting Mouse")
mouse = set_mouse_shortcuts(global_context)

global_context.logger.debug(f"Setting Floating Rules")
floating_layout = set_floating(global_context)


# Always run
@hook.subscribe.startup
def start_config():
    global global_context
    global_context.logger.debug(f"Running autostart script")
    subprocess.call([osp.join(global_context.qtile_path, "autostart.sh")])
