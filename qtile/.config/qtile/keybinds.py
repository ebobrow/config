"""
Keybindings
"""
from libqtile import extension
from libqtile.config import Key, Group, KeyChord
from libqtile.command import lazy

from settings import HEIGHT

MOD = "mod4"
TERMINAL = "st"
BROWSER = "qutebrowser"

keybinds = [
    Key([MOD], "j", lazy.layout.down()),
    Key([MOD], "k", lazy.layout.up()),
    Key([MOD], "h", lazy.layout.left()),
    Key([MOD], "l", lazy.layout.right()),

    Key([MOD, "shift"], "j", lazy.layout.shuffle_down()),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up()),
    Key([MOD, "shift"], "h", lazy.layout.shuffle_left()),
    Key([MOD, "shift"], "l", lazy.layout.shuffle_right()),

    Key([MOD, "control"], "j", lazy.layout.grow_down()),
    Key([MOD, "control"], "k", lazy.layout.grow_up()),
    Key([MOD, "control"], "h", lazy.layout.grow_left()),
    Key([MOD, "control"], "l", lazy.layout.grow_right()),

    Key([MOD, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([MOD, "shift", "control"], "l", lazy.layout.swap_column_right()),

    Key([MOD], "m", lazy.layout.maximize()),
    Key([MOD], "n", lazy.layout.reset(), lazy.layout.normalize()),

    Key([MOD, "shift"], "f", lazy.window.toggle_floating()),
    Key([MOD, "shift"], "m", lazy.window.toggle_fullscreen()),

    Key([MOD, "shift"], "Return", lazy.layout.toggle_split()),
    Key([MOD], "Return", lazy.spawn(TERMINAL)),

    Key([MOD], "Tab", lazy.next_layout()),
    Key([MOD, "shift"], "Tab", lazy.prev_layout()),

    Key([MOD], "w", lazy.window.kill()),

    Key([MOD, "control"], "r",
        lazy.restart(),
        lazy.spawn('qtileerr')), # This only runs if there's an error and qtile can't restart properly
    Key([MOD, "control"], "q", lazy.shutdown()),

    Key([MOD], "b", lazy.spawn(BROWSER)),
    Key([MOD, "shift"], "Return", lazy.run_extension(extension.DmenuRun(
        dmenu_height=HEIGHT
    ))),
    Key([MOD], "e", lazy.spawn("emacs")),

    # Custom scripts
    KeyChord([MOD], "r", [
        Key([], "c", lazy.spawn(TERMINAL + " -e editconf")),
        Key([], "x", lazy.spawn("logout")),
        Key([], "s", lazy.spawn(TERMINAL + " -e services")),
        Key([], "w", lazy.spawn("networkmanager_dmenu")),
        Key([], "o", lazy.spawn("browser")),
        Key([], "a", lazy.spawn("alarm")),
        Key([], "r", lazy.spawn(TERMINAL + " -e repos")),
        Key([], "q", lazy.spawn(TERMINAL + " -e qalc")),
        Key([], "e", lazy.spawn("dmenuunicode"))
    ])
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keybinds.extend([
        # mod1 + letter of group = switch to group
        Key([MOD], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group =
        # switch to & move focused window to group
        Key([MOD, "shift"], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
