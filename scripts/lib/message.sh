#!/bin/bash

F_CYAN="\033[38;2;0;255;255m"
F_GREEN="\033[38;2;127;230;127m"
F_RED="\033[38;2;255;127;127m"
F_ORANGE="\033[38;2;255;165;0m"
F_YELLOW="\033[38;2;255;255;25m"
F_RESET="\033[39m"

function yes_or_no() {
	yes_to_all=${yes_to_all:-0}
	if $yes_to_all; then
		return 0
	fi

	local module=$1
	shift

	while true; do
		read -r -p "$(echo -e "\033[38;5;226m[$module] ${F_ORANGE}$*${F_RESET} [${F_GREEN}y${F_RESET}/${F_RED}n${F_RESET}]: ")" yn
		case $yn in
		[Yy]*) return 0 ;;
		[Nn]*)
			echo -e "${F_YELLOW}Aborted${F_RESET}"
			return 1
			;;
		esac
	done
}

function select_options() {
 ESC=$( printf "\033")
    cursor_blink_on()   { printf "$ESC[?25h"; }
    cursor_blink_off()  { printf "$ESC[?25l"; }
    cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
    print_inactive()    { printf "$2   $1 "; }
    print_active()      { printf "$2  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()         { 
      local key
      IFS= read -rsn1 key 2>/dev/null >&2
      if [[ $key = ""      ]]; then echo enter; fi;
      if [[ $key = $'\x20' ]]; then echo space; fi;
      if [[ $key = $'\x1b' ]]; then
        read -rsn2 key
        if [[ $key = [A ]]; then echo up;    fi;
        if [[ $key = [B ]]; then echo down;  fi;
      fi 
    }
    toggle_option()    {
      local arr_name=$1
      eval "local arr=(\"\${${arr_name}[@]}\")"
      local option=$2
      if [[ ${arr[option]} == true ]]; then
        arr[option]=
      else
        arr[option]=true
      fi
      eval $arr_name='("${arr[@]}")'
    }

    local retval=$1
    local options
    local defaults

    IFS=';' read -r -a options <<< "$2"
    if [[ -z $3 ]]; then
      defaults=()
    else
      IFS=';' read -r -a defaults <<< "$3"
    fi
    local selected=()

    for ((i=0; i<${#options[@]}; i++)); do
      selected+=("${defaults[i]}")
      printf "\n"
    done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - ${#options[@]}))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local active=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for option in "${options[@]}"; do
            local prefix="[ ]"
            if [[ ${selected[idx]} == true ]]; then
              prefix="[x]"
            fi

            cursor_to $(($startrow + $idx))
            if [ $idx -eq $active ]; then
                print_active "$option" "$prefix"
            else
                print_inactive "$option" "$prefix"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            space)  toggle_option selected $active;;
            enter)  break;;
            up)     ((active--));
                    if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
            down)   ((active++));
                    if [ $active -ge ${#options[@]} ]; then active=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    eval $retval='("${selected[@]}")'
}

function message() {
	local module=$1
	shift

	echo -e "${F_CYAN}[$module] ${F_ORANGE}$* $F_RESET"
}

function running() {
	local module=$1
	shift

	echo -e "${F_YELLOW}[$module] ${F_ORANGE}⇒ $* $F_RESET"
}

function action() {
	local module=$1
	shift

	echo -e "${F_RED}[$module] ${F_ORANGE}⇒ $* $F_RESET"
}

function ok() {
	local module=$1
	shift

	echo -e "${F_GREEN}[$module] ${F_ORANGE}⇒ $* $F_RESET"
}
