#!/bin/bash
set -euo pipefail
#####################################################################
# Author    : Erik Dubois
# Website   : https://kiroproject.be
#####################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
#   Purpose:
#   - Show the "install mintstick first" warning for the Format USB and
#     Write ISO to USB service menus, in the user's language.
#
#   Why: both menus need mintstick; one helper keeps the message (and
#   its 13 translations) in a single place. English is the fallback.
#
#####################################################################

export TEXTDOMAIN=kiro-plasma-servicemenus
TEXTDOMAINDIR="$(dirname "$(readlink -f "$0")")/locale"
export TEXTDOMAINDIR

if command -v gettext &>/dev/null; then
    _t() { gettext "$1"; }
else
    _t() { printf '%s' "$1"; }
fi

notify-send -u critical "$(_t "Please install the mintstick package first")"
