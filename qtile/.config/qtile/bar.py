"""
Widgets for top bar
"""
from libqtile import widget

from settings import COLORS

PRIMARY_BG = COLORS["dark_2"]
SECONDARY_BG = COLORS["dark_4"]

widgets = [
    widget.GroupBox(
        fontsize=15,
        borderwidth=3,
        active=COLORS["light_2"],
        inactive=COLORS["gray_0"],
        rounded=False,
        highlight_color=SECONDARY_BG,
        highlight_method="line",
        this_current_screen_border=COLORS["blue_0"],
        this_screen_border=COLORS["blue_0"],
        foreground=COLORS["light_3"],
        background=PRIMARY_BG
    ),
    widget.Sep(),
    widget.CurrentLayout(
        foreground=COLORS["blue_0"],
        font="FiraCode Nerd Font",
    ),
    widget.Sep(),
    widget.WindowName(
        foreground=COLORS["light_3"]
    ),
    widget.Sep(),
    widget.CheckUpdates(
        display_format="{updates} Updates",
        colour_have_updates=COLORS["aqua_1"],
        colour_no_updates=COLORS["aqua_1"],
        no_update_string="0 Updates",
        font="FiraCode Nerd Font",
        execute="st -e paru -Syu",
        distro="Arch_checkupdates"
    ),
    widget.Sep(),
    widget.CPU(
        foreground=COLORS["yellow_1"],
        font="FiraCode Nerd Font"
    ),
    widget.Sep(),
    widget.Net(
        interface='wlp3s0',
        format='{down} ↓↑ {up}',
        foreground=COLORS["purple_0"],
        font="FiraCode Nerd Font"
    ),
    widget.Sep(),
    widget.Battery(
        foreground=COLORS["green_1"],
        discharge_char='↓ ',
        charge_char='⚡',
        format='{char}{percent:2.0%}',
        font="FiraCode Nerd Font",
        low_foreground=COLORS["red_0"],
        low_percentage=0.15,
        notify_below=15
    ),
    widget.Sep(),
    widget.Clock(
        format='%a %B %d - %I:%M:%S %p',
        foreground=COLORS["light_3"],
        font="FiraCode Nerd Font"
    ),
]
