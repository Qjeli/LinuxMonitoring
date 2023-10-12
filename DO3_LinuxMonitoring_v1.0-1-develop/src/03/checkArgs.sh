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
    if [[ $1 -eq $2 || $3 -eq $4 ]]
    then
      echo "Colors shouldn't be similar)"
      exit 1
    fi
}