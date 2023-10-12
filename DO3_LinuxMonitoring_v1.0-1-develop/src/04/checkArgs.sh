#!/bin/bash

# Check number of arguments
function args {
for i in $@
    do
      if [[ i -lt 1 || i -gt 6 ]]
      then
        echo "Numbers should be between 1 and 6"
        exit 1
        fi
    done
}

# Check for matching colors
function colors {
    if [[ $1 -eq $2 ]]
    then
      echo "Colors shouldn't be similar)"
      exit 1
    fi
}

function config_check {
  for i in 0 1 2 3 
  do
    if [[ colorsConfig[i]=${default[i]} ]]
    then
      colorsConfig[i]=${default[i]}
      fi
  done
}

function config_out_check {
  for i in 0 1 2 3
  do
    if [[ colorsConfig[i]=${default[i]} ]]
    then
      conf_out[i]="default"
      fi
  done
}

function default_check {
  if [[ -z $column1_background ]]
  then
    column1_background=21
  fi
  if [[ -z $column1_font_color ]]
  then
    column1_font_color=21
  fi

    if [[ -z $column2_background ]]
  then
    column2_background=21
  fi
  if [[ -z $column2_font_color ]]
  then
    column2_font_color=21
  fi
}