#!/bin/bash

# Get system information
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')
USER=$(whoami)
OS=$(lsb_release -d | awk -F"\t" '{print $2}')
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime | awk '{print $3, $4}' | sed 's/,//')
UPTIME_SEC=$(awk '{print $1} " sec"' /proc/uptime)
IP=$(hostname -I | awk '{print $1}')
MASK=$(ifconfig | grep "inet " | awk '{print $4}' | head -1)
GATEWAY=$(route -n | awk '{print $2}' | sed -n '3p')
RAM_TOTAL=$(free  -k  -t | grep 'Mem' | awk '{printf "%.3f", $2 / 1024 / 1024}')
RAM_USED=$(free  -k  -t | grep 'Mem' | awk '{printf "%.3f", $3 / 1024 / 1024}')
RAM_FREE=$(free  -k  -t | grep 'Mem' | awk '{printf "%.3f", $4 / 1024 / 1024}')
SPACE_ROOT=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $2*1024}')
SPACE_ROOT_USED=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $3*1024}')
SPACE_ROOT_FREE=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $4*1024}')

# Output the information
systemInfo() {
  NORMAL=$(tput sgr0)

  echo "$1$2HOSTNAME =$3$4 $hostname"
  echo "$1$2TIMEZONE =$3$4 $timezone"
  echo "$1$2USER =$3$4 $user"
  echo "$1$2OS =$3$4 $os"
  echo "$1$2DATE =$3$4 $date"
  echo "$1$2UPTIME =$3$4 $uptime"
  echo "$1$2UPTIME_SEC =$3$4 $uptime_sec"
  echo "$1$2IP =$3$4 $ip"
  echo "$1$2MASK =$3$4 $mask"
  echo "$1$2GATEWAY =$3$4 $gateway"
  echo "$1$2RAM TOTAL =$3$4 $ram_total GB"
  echo "$1$2RAM_USED =$3$4 $ram_used GB"
  echo "$1$2RAM_FREE =$3$4 $ram_free GB"
  echo "$1$2SPACE_ROOT =$3$4 $space_root MB"
  echo "$1$2SPACE_ROOT_USED =$3$4 $space_root_used MB"
  echo "$1$2SPACE_ROOT_FREE =$3$4 $space_root_free MB${NORMAL}"
}