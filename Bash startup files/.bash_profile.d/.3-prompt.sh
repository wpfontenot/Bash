#!/bin/bash
#
# $HOME/.bash_profile.d/3-prompt.sh written by: Paul Fontenot
#
###############################################################################
HOURS=$(/usr/bin/date +%H)
MIN=$(/usr/bin/date +%M)
SEC=$(/usr/bin/date +%S)
UPOWER=/usr/bin/upower
###############################################################################
#                                                                             #
# The Prompt                                                                  #
#                                                                             #
###############################################################################
if [[ "$UID" -eq 0 ]]; then
	if [[ -f "$UPOWER" ]]; then		
		PS1="$B_RED-($RESET$B_WHITE\u$RESET$B_YELLOW@$RESET$B_WHITE\H$RESET   \
		$B_RED)-($RESET$B_RED\$(lsbytesum)$RESET$B_RED)-($RESET$B_WHITE \$:   \
		\w $RESET$B_RED)-\n-($RESET$B_WHITE\d$RESET $B_YELLOW$HOURS$RESET     \
		$B_WHITE:$RESET$B_YELLOW$MIN$RESET$B_WHITE:$RESET$B_YELLOW$SEC$RESET  \
		$B_RED)-($RESET$B_WHITE Battery: $RESET$B_GREEN\$(battery1)$RESET     \
		$B_RED)-$RESET "
	else
		PS1="$B_RED-($RESET$B_WHITE\u$RESET$B_YELLOW@$RESET$B_WHITE\H$RESET   \ 
		$B_RED)-($RESET$B_RED\$(lsbytesum)$RESET$B_RED)-($RESET$B_WHITE\$:    \ 
		\w $RESET$B_RED)-\n-($RESET$B_WHITE\d$RESET $B_YELLOW$HOURS$RESET     \ 
		$B_WHITE:$RESET$B_YELLOW$MIN$RESET$B_WHITE:$RESET$B_YELLOW$SEC$RESET  \
		$B_RED)-($RESET$B_WHITE Load: $RESET$B_GREEN\$(load)$RESET$B_RED)-    \
		$RESET"
	fi
else
	if [[ -f "$UPOWER" ]]; then
		PS1="$B_BLUE-($RESET$B_WHITE\u$RESET$B_YELLOW@$RESET$B_WHITE\H$RESET  \
		$B_BLUE)-($RESET$B_RED\$(lsbytesum)$RESET$B_BLUE)-($RESET$B_WHITE \$: \ 
		\w $RESET$B_BLUE)-\n-($RESET$B_WHITE\d$RESET $B_YELLOW$HOURS$RESET    \
		$B_WHITE:$RESET$B_YELLOW$MIN$RESET$B_WHITE:$RESET$B_YELLOW$SEC$RESET  \
		$B_BLUE)-($RESET$B_WHITE Battery: $RESET$B_GREEN\$(battery1)$RESET    \
		$B_BLUE)-$RESET "
	else
		PS1="$B_BLUE-($RESET$B_WHITE\u$RESET$B_YELLOW@$RESET$B_WHITE\H$RESET  \
		$B_BLUE)-($RESET$B_RED\$(lsbytesum)$RESET$B_BLUE)-($RESET$B_WHITE \$: \
		\w $RESET$B_BLUE)-\n-($RESET$B_WHITE\d$RESET $B_YELLOW$HOURS$RESET    \
		$B_WHITE:$RESET$B_YELLOW$MIN$RESET$B_WHITE:$RESET$B_YELLOW$SEC$RESET  \
		$B_BLUE)-($RESET$B_WHITE Load: $RESET$B_GREEN\$(load)$RESET$B_BLUE)-  \
		$RESET"
	fi
fi

export PS1