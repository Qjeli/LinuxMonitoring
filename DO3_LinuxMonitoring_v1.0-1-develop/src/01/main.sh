#!/bin/bash

chmod +x ../01/main.sh

# check if the parameter is a number
if [[ $1 =~ ^[0-9]+$ ]]; then
  echo "Error: Invalid input. Parameter is a number."
else
  echo "Parameter value: $1"
fi
