#!/bin/sh
# Keyboard setup for i3 startup.
# Must run as ONE sequential script: setxkbmap resets the entire keymap,
# so the xmodmap tweaks have to come after it, not race against it.

# Small buffer so late session-startup keyboard initialisation can't clobber us.
sleep 1

# gb/pl layouts, both-shifts toggles layout, caps lock acts as Escape.
# The bare -option first clears any inherited options so the result is deterministic.
setxkbmap -layout gb,pl -option -option grp:shifts_toggle -option caps:escape

# Physical Escape key (keycode 9) produces grave/backtick.
# (caps->Escape is already handled by caps:escape above, so no keycode 66 line needed.)
xmodmap -e "keycode 9 = grave"
