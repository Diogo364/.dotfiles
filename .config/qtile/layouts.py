import re
from typing import List

from libqtile import layout
from libqtile.config import Match, MatchAll
from utils import CustomContext, set_default_layouts_config


def build_layout(*layout_types, **kwargs) -> List:
    layouts = []
    for layout_type in layout_types:
        layout_fn = getattr(layout, layout_type)
        layouts.append(layout_fn(**kwargs))
    return layouts


def set_layouts(custom_context: CustomContext):

    default_layouts_config = set_default_layouts_config(
        custom_context.current_colorscheme.colors[1]
    )

    return build_layout(
        "Columns",
        "Max",
        # "MonadTall",
        # "Stack",
        # "MonadWide",
        # "Tile",
        # "RatioTile",
        # "Bsp",
        # "Matrix",
        # "TreeTab",
        # "VerticalTile",
        # "Zoomy",
        **default_layouts_config
    )


def set_floating(custom_context: CustomContext):
    default_layouts_config = set_default_layouts_config(
        custom_context.current_colorscheme.colors[1]
    )
    float_rules = layout.Floating.default_float_rules

    # Simple Rules
    float_rules += [
        Match(role="bubble"),
        Match(title="About Pale Moon"),
        Match(title="alsamixer"),
        Match(title="branchdialog"),
        Match(title="File Transfer*"),
        Match(title="i3_help"),
        Match(title="MuseScore: Play Panel"),
        Match(title="Picture in picture"),
        Match(title="pinentry"),
        Match(wm_class="calamares"),
        Match(wm_class="Clipgrab"),
        Match(wm_class="confirmreset"),
        Match(wm_class="Eog"),
        Match(wm_class="fpakman"),
        Match(wm_class="GParted"),
        Match(wm_class="Lightdm-settings"),
        Match(wm_class="Lxappearance"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="Manjaro-hello"),
        Match(wm_class="Manjaro Settings Manager"),
        Match(wm_class="Nitrogen"),
        Match(wm_class="Oblogout"),
        Match(wm_class="octopi"),
        Match(wm_class="Pamac-manager"),
        Match(wm_class="Pavucontrol"),
        Match(wm_class="qt5ct"),
        Match(wm_class="Qtconfig-qt4"),
        Match(wm_class="Simple-scan"),
        Match(wm_class="Skype"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="sxiv"),
        Match(wm_class="Timeset-gui"),
        Match(wm_class="Totem"),
        Match(wm_class="Xfburn"),
        Match(wm_class="com.cisco.anyconnect.gui"),
    ]

    # Regex Rules
    float_rules += [
        Match(title=re.compile(r"^opencv-preview.*")),
        Match(wm_class=re.compile(".*[Aa]randr.*")),
        Match(wm_class=re.compile(".*[Cc]alculator.*")),
        Match(wm_class=re.compile(r".*[Gg]nome.*")),
        Match(wm_class=re.compile(r"kdeconnect.*")),
        Match(wm_class=re.compile(r"[mM]atplotlib")),
        Match(wm_class=re.compile(r"[Pp]ritunl")),
        Match(wm_class=re.compile(r"[Pp]ulse")),
        Match(wm_class=re.compile(r"[Vv]irtualbox")),
    ]

    # Complex rules
    float_rules += [
        MatchAll(
            Match(wm_class="Brave-browser"),
            Match(role="pop-up"),
        ),
    ]
    return layout.Floating(float_rules=float_rules, **default_layouts_config)
