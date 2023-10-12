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
RAM_TOTAL=$(free -m | awk '/Mem:/ {printf("%.3f GB\n"), $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/ {printf("%.3f GB\n"), $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/ {printf("%.3f GB\n"), $4/1024}')
SPACE_ROOT=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $2*1024}')
SPACE_ROOT_USED=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $3*1024}')
SPACE_ROOT_FREE=$(df -h | awk '$NF=="/"{printf "%.2f MB\n", $4*1024}')

# Output the information
systemInfo() {
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL"
    echo "RAM_USED = $RAM_USED"
    echo "RAM_FREE = $RAM_FREE"
    echo "SPACE_ROOT = $SPACE_ROOT"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}