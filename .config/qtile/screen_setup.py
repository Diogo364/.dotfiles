from libqtile import bar, qtile
from libqtile.config import Screen
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
from utils import CustomContext
from Xlib import display as xdisplay

FONT = "JetBrainsMono Nerd Font"
BAR_SIZE = 35
MARGIN = 4


def set_widget_border(color):
    return BorderDecoration(
        colour=color, border_width=[0, 0, 3, 0], padding_x=2, padding_y=None
    )


def get_num_monitors():
    num_monitors = 0
    try:
        display = xdisplay.Display()
        screen = display.screen()
        resources = screen.root.xrandr_get_screen_resources()

        for output in resources.outputs:
            monitor = display.xrandr_get_output_info(output, resources.config_timestamp)
            preferred = False
            if hasattr(monitor, "preferred"):
                preferred = monitor.preferred
            elif hasattr(monitor, "num_preferred"):
                preferred = monitor.num_preferred
            if preferred:
                num_monitors += 1
    except Exception as e:
        # always setup at least one monitor
        return 1
    else:
        return num_monitors


widget_defaults = dict(
    font=FONT,
    fontsize=16,
    padding=4,
)


def set_widgets(custom_context: CustomContext):
    extension_defaults = widget_defaults.copy()
    border_decorator_list = [
        set_widget_border(custom_context.current_colorscheme.colors[i]) for i in [1, 2]
    ]

    widgets_list = [
        widget.Prompt(**extension_defaults),
        widget.GroupBox(
            borderwidth=10,
            rounded=True,
            highlight_method="block",
            hide_unused=True,
            inactive=custom_context.current_colorscheme.colors[-1],
            other_current_screen_border=[custom_context.current_colorscheme.colors[6]],
            this_current_screen_border=[custom_context.current_colorscheme.colors[5]],
            other_screen_border=[custom_context.current_colorscheme.colors[6]],
            this_screen_border=[custom_context.current_colorscheme.colors[5]],
            disable_drag=True,
            use_mouse_wheel=False,
            **widget_defaults
        ),
        widget.TextBox(text="|", **widget_defaults),
        widget.CurrentLayoutIcon(scale=0.5, **widget_defaults),
        widget.CurrentLayout(**widget_defaults),
        widget.TextBox(text="|", **widget_defaults),
        widget.WindowName(max_chars=40, for_current_screen=True, **widget_defaults),
        widget.Spacer(length=8, **widget_defaults),
        widget.Chord(
            foreground=custom_context.current_colorscheme.colors[-1],
            fmt="{}",
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.CPU(
            format="Cpu: {load_percent}%",
            foreground=border_decorator_list[1].colour,
            decorations=[border_decorator_list[1]],
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Memory(
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(
                    custom_context.apps_dict["terminal"] + " -e htop"
                )
            },
            format="{MemUsed:.2f}{mm}",
            fmt="Mem: {}",
            measure_mem="G",
            foreground=border_decorator_list[0].colour,
            decorations=[border_decorator_list[0]],
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.DF(
            update_interval=60,
            partition="/home",
            format="{uf}{m}",
            fmt="Disk: {}",
            visible_on_warn=False,
            foreground=border_decorator_list[1].colour,
            decorations=[border_decorator_list[1]],
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Volume(
            fmt="Vol: {}",
            mute_format="Mute",
            get_volume_command="pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print $5}'",
            check_mute_command="pactl get-sink-mute @DEFAULT_SINK@ | grep -o yes",
            check_mute_string="yes",
            foreground=border_decorator_list[0].colour,
            decorations=[border_decorator_list[0]],
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Clock(
            fmt=" {}",
            format="%A %d-%b-%Y",
            timezone="America/Manaus",
            foreground=border_decorator_list[1].colour,
            decorations=[border_decorator_list[1]],
            mouse_callbacks={
                "Button1": lambda: qtile.spawn(custom_context.apps_dict["calendar"])
            },
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Clock(
            fmt=" {}",
            format="%H:%M",
            timezone="America/Manaus",
            foreground=border_decorator_list[0].colour,
            decorations=[border_decorator_list[0]],
            mouse_callbacks={
                "Button1": lambda: qtile.spawn(custom_context.apps_dict["calendar"])
            },
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Battery(
            charge_char=" ",
            discharge_char=" ",
            empty_char=" ",
            format="{char} {percent:2.0%}",
            full_char=" ",
            not_charging_char="",
            low_foreground=custom_context.current_colorscheme.colors[-1],
            low_percentage=0.3,
            notify_below=0.3,
            show_short_text=False,
            foreground=border_decorator_list[1].colour,
            decorations=[border_decorator_list[1]],
            **widget_defaults
        ),
        widget.Spacer(length=8, **widget_defaults),
        widget.Systray(**widget_defaults),
        widget.Spacer(length=8, padding=3),
    ]
    return widgets_list


def set_screen(custom_context: CustomContext):
    widget_list = set_widgets(custom_context)
    screens = [
        Screen(
            top=bar.Bar(
                widget_list, size=BAR_SIZE, margin=MARGIN, background="#101010DD"
            ),
        ),
    ]
    if get_num_monitors() > 1:
        screens.append(
            Screen(
                top=bar.Bar(
                    [
                        *widget_list[:3],
                        widget.CurrentLayoutIcon(scale=0.5, **widget_defaults),
                        widget.CurrentLayout(**widget_defaults),
                        *widget_list[5:-2],
                    ],
                    size=BAR_SIZE,
                    margin=MARGIN,
                    background="101010",
                ),
            )
        )
    return screens
