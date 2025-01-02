import json
import os.path as osp

from layouts import build_layout
from libqtile.config import Group, Key
from libqtile.lazy import lazy
from utils import CustomContext, set_default_layouts_config


@lazy.function
def switch_to_group_screen(qtile, groupname: str | None = None):
    if groupname is None:
        return
    group = qtile.groups_map[groupname]
    # if group is already on a screen...
    if group.screen:
        qtile.focus_screen(group.screen.index)
    # it's not on a screen
    else:
        group.toscreen()


def set_groups(custom_context: CustomContext):
    mod = custom_context.mod_key
    keys = custom_context.keys if custom_context.keys is not None else []

    with open(osp.join(custom_context.assets_path, "groups_information.json")) as f:
        groups_information = json.load(f)

    groups = []
    for info in groups_information:
        if "layouts" in info:
            info["layouts"] = build_layout(
                *info["layouts"],
                **set_default_layouts_config(
                    custom_context.current_colorscheme.colors[1]
                ),
            )

        # Swap commands from spawn for those in the global context
        if "spawn" in info:
            for idx, command in enumerate(info["spawn"]):
                if command in custom_context.apps_dict:
                    info["spawn"][idx] = custom_context.apps_dict[command]

        curr_group = Group(**info)
        groups.append(curr_group)

        keys.extend(
            [
                # mod + group number = switch to group
                Key(
                    [mod],
                    curr_group.name,
                    switch_to_group_screen(groupname=curr_group.name),
                    desc=f"Switch to group {curr_group.name}",
                ),
                # mod + shift + group number = move focused window to group
                Key(
                    [mod, "shift"],
                    curr_group.name,
                    lazy.window.togroup(curr_group.name, switch_group=False),
                    desc=f"Switch to & move focused window to group {curr_group.name}",
                ),
            ]
        )
    return groups
