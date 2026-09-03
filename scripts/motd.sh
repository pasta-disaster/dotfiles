#!/usr/bin/env bash

# █ ▀ ▄ ▌ ▐ ▚ ▞ ▙ ▛ ▜ ▟  ▖ ▗ ▘ ▝


# █ full
# ▀ upper half
# ▄ lower half
# ▌ left half
# ▐ right half

ship="       ▌   
           
     ▌     
           
    ▄█▄    
▄█████████▄
▀▀▀▀▀▀▀▀▀▀▀"

invader1="  ▀▄   ▄▀  
 ▄█▀███▀█▄ 
█▀███████▀█
▀ ▀▄▄ ▄▄▀ ▀"

invader2=" ▄▄▄████▄▄▄ 
███▀▀██▀▀███
▀▀███▀▀███▀▀
 ▀█▄ ▀▀ ▄█▀ "

invader3="  ▄██▄  
▄█▀██▀█▄
▀█▀██▀█▀
▀▄    ▄▀"

invader4="▄ ▀▄   ▄▀ ▄
█▄█▀███▀█▄█
▀█████████▀
 ▄▀     ▀▄ "

invader5=" ▄▄▄████▄▄▄ 
███▀▀██▀▀███
▀▀▀██▀▀██▀▀▀
▄▄▀▀ ▀▀ ▀▀▄▄"

invader6="  ▄██▄  
▄█▀██▀█▄
▀▀█▀▀█▀▀
▄▀▄▀▀▄▀▄"

invaders=(
"  ▀▄   ▄▀  
 ▄█▀███▀█▄ 
█▀███████▀█
▀ ▀▄▄ ▄▄▀ ▀"
" ▄▄▄████▄▄▄ 
███▀▀██▀▀███
▀▀███▀▀███▀▀
 ▀█▄ ▀▀ ▄█▀ "
"  ▄██▄  
▄█▀██▀█▄
▀█▀██▀█▀
▀▄    ▄▀"
"▄ ▀▄   ▄▀ ▄
█▄█▀███▀█▄█
▀█████████▀
 ▄▀     ▀▄ "
" ▄▄▄████▄▄▄ 
███▀▀██▀▀███
▀▀▀██▀▀██▀▀▀
▄▄▀▀ ▀▀ ▀▀▄▄"
"  ▄██▄  
▄█▀██▀█▄
▀▀█▀▀█▀▀
▄▀▄▀▀▄▀▄")
# invaders=(
# "  ▀▄   ▄▀
#  ▄█▀███▀█▄
# █▀███████▀█
# ▀ ▀▄▄ ▄▄▀ ▀"
# " ▄▄▄████▄▄▄
# ███▀▀██▀▀███
# ▀▀███▀▀███▀▀
#  ▀█▄ ▀▀ ▄█▀"
# "  ▄██▄
# ▄█▀██▀█▄
# ▀█▀██▀█▀
# ▀▄    ▄▀"
# "▄ ▀▄   ▄▀ ▄
# █▄█▀███▀█▄█
# ▀█████████▀
#  ▄▀     ▀▄"
# " ▄▄▄████▄▄▄
# ███▀▀██▀▀███
# ▀▀▀██▀▀██▀▀▀
# ▄▄▀▀ ▀▀ ▀▀▄▄"
# "  ▄██▄
# ▄█▀██▀█▄
# ▀▀█▀▀█▀▀
# ▄▀▄▀▀▄▀▄")


invade_squashed() {
    if [[ -z $1 ]]; then
        echo "nej"
    elif (( $1 == 0 )); then
        echo "   ▐"
        echo "  ▗"
        echo "  ▝"
        echo "  ▟▖"
        echo "▟████▖"
        echo "▀▀▀▀▀▘"
        echo
    elif (( $1 == 1 )); then
        echo " ▚ ▗▘"
        echo "▗▛█▛▙"
        echo "▛███▛▌"
        echo "▘▚▖▄▘▘"
        echo
    elif (( $1 == 2 )); then
        echo "▗▄██▄▖"
        echo "█▛▜▛▜█"
        echo "▀█▛▜█▀"
        echo "▝▙▝▘▟▘"
        echo
    elif (( $1 == 3 )); then
        echo " ▟▙"
        echo "▟▜▛▙"
        echo "▜▜▛▛"
        echo "▚  ▞"
        echo
    elif (( $1 == 4 )); then
        echo "▖▚ ▗▘▖"
        echo "▙▛█▛▙▌"
        echo "▜████▘"
        echo "▗▘  ▚"
        echo
    elif (( $1 == 5 )); then
        echo "▗▄██▄▖"
        echo "█▛▜▛▜█"
        echo "▀▜▛▜▛▀"
        echo "▄▀▝▘▀▄"
        echo
    elif (( $1 == 6 )); then
        echo " ▟▙"
        echo "▟▜▛▙"
        echo "▀▛▜▀"
        echo "▞▞▚▚"
        echo
    fi
}

draw_invader() {
    if [[ -z $1 ]]; then
        echo "nej"
    elif (( $1 == 0 )); then
        echo "       ▌"
        echo
        echo "     ▌"
        echo "     "
        echo "    ▄█▄"
        echo "▄█████████▄"
        echo "▀▀▀▀▀▀▀▀▀▀▀"
        echo
    elif (( $1 == 1 )); then
        echo "  ▀▄   ▄▀  "
        echo " ▄█▀███▀█▄ "
        echo "█▀███████▀█"
        echo "▀ ▀▄▄ ▄▄▀ ▀"
        echo
    elif (( $1 == 2 )); then
        echo " ▄▄▄████▄▄▄ "
        echo "███▀▀██▀▀███"
        echo "▀▀███▀▀███▀▀"
        echo " ▀█▄ ▀▀ ▄█▀ "
        echo 
    elif (( $1 == 3 )); then
        echo "  ▄██▄  "
        echo "▄█▀██▀█▄"
        echo "▀█▀██▀█▀"
        echo "▀▄    ▄▀"
        echo
    elif (( $1 == 4 )); then
        echo "▄ ▀▄   ▄▀ ▄"
        echo "█▄█▀███▀█▄█"
        echo "▀█████████▀"
        echo " ▄▀     ▀▄ "
        echo
    elif (( $1 == 5 )); then
        echo " ▄▄▄████▄▄▄ "
        echo "███▀▀██▀▀███"
        echo "▀▀▀██▀▀██▀▀▀"
        echo "▄▄▀▀ ▀▀ ▀▀▄▄"
        echo
    elif (( $1 == 6 )); then
        echo "  ▄██▄  "
        echo "▄█▀██▀█▄"
        echo "▀▀█▀▀█▀▀"
        echo "▄▀▄▀▀▄▀▄"
        echo
    else
        echo "unknown"
    fi
}

# distros=("Ubuntu" "Red Hat" "Fedora")
# distros+=("Kali")
# echo ${distros[*]}

# invade $1

# echo -e "${invader1}\t${invader2}" | pr -2 -Ts^I
spacing=2
term_width=$(tput cols)

selected=()
selected_i=()
selected_counter=0
width_counter=0
while (( $width_counter < $term_width )); do

    rand=$(shuf -i 0-5 -n1)

    invader="${invaders[rand]}"
    invader_size=${#invader}
    invader_width=$((invader_size / 4))

    echo $invader
    #echo "${rand}: ${invader_size} -> ${invader_width}"

   
    if (( $width_counter + $invader_width < $term_width )); then
        #echo "Adding invader to list"
        selected+=("${invader}")
        ((selected_counter+=1))
    #else
        #echo "Too many chars"
    fi

    ((width_counter += invader_width + spacing))

    #echo "USED: ${width_counter} / ${term_width} chars"
done

# echo ${selected[*]}

sirlected=("${invaders[0]}" "${invaders[1]}")
# sirlected=("
#   ▀▄   ▄▀  
#  ▄█▀███▀█▄ 
# █▀███████▀█
# ▀ ▀▄▄ ▄▄▀ ▀"
# "
#  ▄▄▄████▄▄▄ 
# ███▀▀██▀▀███
# ▀▀███▀▀███▀▀
#  ▀█▄ ▀▀ ▄█▀ ")

# echo ${selected[@]}


# printf "%s\n" "${invaders[0]}" "${invaders[5]}" | pr -2 -Ts'  '
# printf "%s\n" "${selected[*]}" | pr -${#selected[@]} -Ts'  '
# printf "%s\n" "${sirlected[*]}" | pr -2 -Ts'  '
# echo "${selected[*]}" | pr -${#selected[@]} -Ts" "

arglist=""
for (( i = 0; i <= $selected_counter; i++ )); do
    arglist+="${invaders[i]}\n"
done

# printf "%b" "${arglist}"
# printf "%b\n" "${arglist}" | pr -$selected_counter -TS'  '
# printf "%b\n" "${invaders[0]}\n${invaders[5]}" | pr -2 -Ts'  '
printf "%b\n" "${invaders[0]}\n${invaders[5]}\n${invaders[1]}\n${invaders[3]}\n${invaders[2]}\n${invaders[4]}\n${invaders[2]}\n${invaders[1]}" | pr -8 -Ts'  '
# printf "%b\n" "${invaders[0]}\n${invaders[5]}" | column -e -t -N2 -s"\n"


# argstr="\"\${invaders[0]}\"\\n\"\${invaders[1]}\""
# column -c 2 <<eof
# ${invaders[0]}
# ${invaders[1]}
# eof

# paste <(printf %s "${invaders[0]}") <(printf %s "${invaders[1]}") <(printf %s "${invaders[2]}") <(printf %s "${invaders[3]}") <(printf %s "${invaders[4]}")  <(printf %s "${invaders[5]}")

# $arglist=""
# for inv in {0..$selected_counter}; do
# for (( i = 0; i <= $selected_counter; i++ )); do
#     arglist+=" <(printf \"%s\" \"${invaders[i]}\")"
# done
# eval 'echo $arglist'
# paste $(eval 'echo $arglist')
# echo $arglist | xargs paste


# printf "%s\n" "${invaders[0]}":"${invaders[1]}":"${invaders[2]}" | column -t -s ':'
# printf "%s\n"  | pr -2 -Ts'  '

# argstr="\"\${invaders[0]}\" \"\${invaders[1]}\""
# echo $(eval $argstr)
# printf "%s\n" $(eval "echo $argstr") | pr -2 -Ts'  '

# test1="1
# 2"
# test2="3
# 4"

# test3=("1
# 2"
# "3
# 4")
# printf "%s\n" "${test3[0]}" "${test3[1]}" | pr -2 -Ts'  '
# printf "%s\n" ${test3[*]} | pr -2 -Ts'  '
# column -c4 -s':' <<eof
# $test1:
# $test2
# eof
# printf "${invaders[0]}:${invaders[1]}" | column -t -s":"

# testargs="\"\${test3[0]}\" \"\${test3[1]}\""

# printf "%s\n" "${test3[0]}" "${test3[1]}"
# printf "%s\n" $testargs
# eval 'printf "%s" $testargs'


