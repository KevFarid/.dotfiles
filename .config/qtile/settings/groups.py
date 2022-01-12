# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-fa-chrome,
# nf-mdi-visualstudio,
# nf-dev-terminal,
# nf-fa-code,
# nf-mdi-slack,
# nf-fa-spotify,
# nf-mdi-image,
# nf-mdi-layers

groups = [Group(i) for i in [
    "   ", " ﬏  ", "   ", "   ", " 聆  ", "   ", "   ", "   ", "   ",
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
