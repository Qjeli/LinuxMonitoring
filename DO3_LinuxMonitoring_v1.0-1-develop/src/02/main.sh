#!/bin/bash

chmod +x ../02/*.sh

. ./systemInfo.sh

systemInfo

# Prompt user to save to file
read -p "Save this information to a file? (Y/N): " answer

if [[ $answer =~ ^[Yy]$ ]]; then
  # Get the current date and time
  curr_date=$(date +"%d_%m_%y_%H_%M_%S")

  # Create the file name with current date and time
  filename="$curr_date.status"

  # Write the information to the file
  echo -e "HOSTNAME = $HOSTNAME\nTIMEZONE = $TIMEZONE\nUSER = $USER\nOS = $OS\nDATE = $DATE\nUPTIME = $UPTIME\nUPTIME_SEC = $UPTIME_SEC\nIP = $IP\nMASK = $MASK\nGATEWAY = $GATEWAY\nRAM_TOTAL = $RAM_TOTAL\nRAM_USED = $RAM_USED\nRAM_FREE = $RAM_FREE\nSPACE_ROOT = $SPACE_ROOT\nSPACE_ROOT_USED = $SPACE_ROOT_USED\nSPACE_ROOT_FREE = $SPACE_ROOT_FREE" > "$filename"

  echo "Information saved to file $filename."
else
  echo "Information not saved to file."
fi
