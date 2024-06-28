# Term Options
if [[ $TERM = *256* ]]; then
    BPP_COLOR[DECORATION]=${BPP_COLOR[RESET]}$(bpp_mk_prompt_color 25) # blue-ish
    BPP_COLOR[GOOD]="$(bpp_mk_prompt_color 47)" # Bright green
    BPP_COLOR[WARNING]=${BPP_BGCOLOR[DARKGREY]}${BPP_COLOR[BOLD]}${BPP_COLOR[YELLOW]}
    BPP_COLOR[CRITICAL]=${BPP_COLOR[BRIGHTRED]}
    BPP_COLOR[INFO]=${BPP_COLOR[GREY]}
else
    BPP_COLOR[DECORATION]=${BPP_COLOR[RESET]}${BPP_COLOR[CYAN]}
    BPP_COLOR[GOOD]=${BPP_COLOR[BOLD]}${BPP_COLOR[GREEN]}
    BPP_COLOR[WARNING]=${BPP_COLOR[DARKGREY]}${BPP_COLOR[BOLD]}${BPP_COLOR[YELLOW]}
    BPP_COLOR[CRITICAL]=${BPP_COLOR[BRIGHTRED]}
    BPP_COLOR[INFO]=${BPP_COLOR[GREY]}
fi