#!/bin/bash

f_black=$(tput setaf 0)
f_red=$(tput setaf 1)
f_green=$(tput setaf 2)
f_blue=$(tput setaf 4)
f_purple=$(tput setaf 5)
f_white=$(tput setaf 7)
foreG=($f_black $f_red $f_green $f_blue $f_purple $f_white)

b_black=$(tput setab 0)
b_red=$(tput setab 1)
b_green=$(tput setab 2)
b_blue=$(tput setab 4)
b_purple=$(tput setab 5)
b_white=$(tput setab 7)
backG=($b_black $b_red $b_green $b_blue $b_purple $b_white)