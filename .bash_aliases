#!/bin/bash
 
make_directory_and_cd_into_it () { 
    mkdir $1
    cd $1 
}

hi() {

  datestr="+%A, %d %B, %Y => %l:%M %p"

    echo "                                                                    "
    echo " ███╗   ███╗ ██████╗ ██╗   ██╗ ██████╗██╗  ██╗███████╗██╗  ██╗  ██╗ "
    echo " ████╗ ████║██╔═══██╗██║   ██║██╔════╝██║  ██║██╔════╝██║  ██║  ██║ "
    echo " ██╔████╔██║██║   ██║██║   ██║██║     ███████║█████╗  ███████║  ██║ "
    echo " ██║╚██╔╝██║██║   ██║██║   ██║██║     ██╔══██║██╔══╝  ██╔══██║  ╚═╝ "
    echo " ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝╚██████╗██║  ██║███████╗██║  ██║  ██╗ "
    echo " ╚═╝     ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═╝ "
    echo "                                                                    "
    echo "Today is $(date "$datestr")"
}
 
alias clr='clear'
alias md='make_directory_and_cd_into_it'
 
alias run='clear && ./main'
alias bldc='clear && gcc -o *.c main.c -lm'
alias bldnrunc='gcc -o main *.c -lm && clear && ./main'
 
alias bldcpp='clear && g++ -std=c++17 *.cpp -o main'
alias bldnruncpp='g++ -std=c++17 *.cpp -o main && clear && ./main'
 
alias bldwas='clang++ -fsanitize=address *.cpp -o main'
alias bldwasc='clang++ -fsanitize=address *.c -o main'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias minecraft='java -jar ~/.local/bin/SKlauncher-3.2.12.jar'

alias led='echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness'

gl++ () {
  g++ $1 -lGL -lGLU -lglut -o scene
}
