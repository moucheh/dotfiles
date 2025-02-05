#!/bin/bash
 
make_directory_and_cd_into_it () { 
    mkdir $1
    cd $1 
}
 
alias sc='sudo start_container'
 
alias clr='clear'
alias md='make_directory_and_cd_into_it'
 
alias run='clear && ./main'
alias bldc='clear && gcc -o *.c main.c -lm'
alias bldnrunc='gcc -o main *.c -lm && clear && ./main'
 
alias bldcpp='clear && g++ -std=c++17 *.cpp -o main'
alias bldnruncpp='g++ -std=c++17 *.cpp -o main && clear && ./main'
 
alias bldwas='clang++ -fsanitize=address *.cpp -o main'
alias bldwasc='clang++ -fsanitize=address *.c -o main'

alias fp='cd ~/Projects/FP-fsx'
alias xv6='cd ~/Projects/OS-c/xv6-public/'
alias os='cd ~/Projects/OS-c/muhamed_taletovic_os24/'
alias ost='cd ~/Projects/OS-c/muhamed_taletovic_os24/ && tmux'

alias y3='cd ~/College/year3/'
alias y3os='cd ~/College/year3/os/'
alias y3fp='cd ~/College/year3/fp/'

alias vim='nvim'
alias vi='nvim'

alias led='echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness'

alias vak='firefox https://vaktija.ba/tuzla'
