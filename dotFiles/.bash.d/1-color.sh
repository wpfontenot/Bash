#!/bin/bash
#
# $HOME/.bash_profile.d/1-color.sh written by: Paul Fontenot
#
###############################################################################
#                                                                             #
# Color codes and control characters                                          #
#                                                                             #
###############################################################################
# Colors:
#   0   to restore default color
#   1   for brighter colors
#   4   for underlined text
#   5   for flashing text
#  30   for black foreground
#  31   for red foreground
#  32   for green foreground
#  33   for yellow (or brown) foreground
#  34   for blue foreground
#  35   for purple foreground
#  36   for cyan foreground
#  37   for white (or gray) foreground
#  40   for black background
#  41   for red background
#  42   for green background
#  43   for yellow (or brown) background
#  44   for blue background
#  45   for purple background
#  46   for cyan background
#  47   for white (or gray) background
#
# Escape Codes
#  \a      Bell (ASCII 7)
#  \b      Backspace (ASCII 8)
#  \e      Escape (ASCII 27)
#  \f      Form feed (ASCII 12)
#  \n      Newline (ASCII 10)
#  \r      Carriage Return (ASCII 13)
#  \t      Tab (ASCII 9)
#  \v      Vertical Tab (ASCII 11)
#  \?      Delete (ASCII 127)
#  \nnn    Any character (octal notation)
#  \xnnn   Any character (hexadecimal notation)
#  \_      Space
#  \\      Backslash (\)
#  \^      Caret (^)
#  \#      Hash mark (#)
#
# Note that escapes are necessary to enter a space, backslash, caret, or any
# control character anywhere in the string, as well as a hash mark as the first
# character.
#
# Reset
RESET="\[\033[0;00m\]"
###############################################################################
#                                                                             #
# Regular colors                                                              #
#                                                                             #
###############################################################################
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[o;36m\]"
WHITE="\[\033[0;37m\]"
###############################################################################
#                                                                             #
# Bold colors                                                                 #
#                                                                             #
###############################################################################
B_BLACK="\[\033[1;30m\]"
B_RED="\[\033[1;31m\]"
B_GREEN="\[\033[1;32m\]"
B_YELLOW="\[\033[1;33m\]"
B_BLUE="\[\033[1;34m\]"
B_PURPLE="\[\033[1;35m\]"
B_CYAN="\[\033[1;36m\]"
B_WHITE="\[\033[1;37m\]"
################################################################################
#
# Time to export
#
################################################################################
export RESET BLACK RED GREEN BLUE YELLOW PURPLE CYAN WHITE \
    B_BLACK B_RED B_GREEN B_BLUE B_YELLOW B_PURPLE B_CYAN B_WHITE