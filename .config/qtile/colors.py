import json
import os
from dataclasses import dataclass
from typing import Dict, List, Optional

import yaml

PYWAL_COLORS_PATH = os.path.expanduser("~/.cache/wal/colors.json")


@dataclass
class ColorScheme:
    bg: List[str]
    fg: List[str]
    colors: List[List[str]]

    @classmethod
    def from_list(cls, color_list: List[List[str]]):
        bg = color_list.pop(0)
        fg = color_list.pop(0)
        return cls(bg, fg, color_list)


def extract_colors_from_yaml(
    yaml_file, key: Optional[str] = None
) -> Dict[str, ColorScheme]:
    with open(yaml_file) as cf:
        color_file_content = yaml.safe_load(cf)
    colorscheme_dict = color_file_content if key is None else color_file_content[key]
    return {
        colorscheme_name: ColorScheme.from_list(colorscheme_element)
        for colorscheme_name, colorscheme_element in colorscheme_dict.items()
    }


def extract_colors_from_pywal() -> ColorScheme:
    with open(PYWAL_COLORS_PATH, "r") as cf:
        pywal_colors = json.load(cf)
    return ColorScheme(
        pywal_colors["special"]["background"],
        pywal_colors["special"]["foreground"],
        list(pywal_colors["colors"].values()),
    )


def get_all_colors(yaml_file, key: Optional[str] = None) -> Dict[str, ColorScheme]:
    return {
        "pywal": extract_colors_from_pywal(),
        **extract_colors_from_yaml(yaml_file, key),
    }
