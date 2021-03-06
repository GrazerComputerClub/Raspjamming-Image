#!/bin/sh

RaspberryPiBoardLogo(){
echo -n "\033[0;32m
    .~~.   .~~. \033[0;31m  Raspberry Pi \033[0;32m
   '. \ ' ' / .'   \033[0;31m
    .~ .~~~..~.    \033[0;37m    ___                  _                  _          \033[0;31m
   : .~.'~'.~. :   \033[0;37m   / _ \___ ____ ___    (_)__  __ _  __ _  (_)__  ___  \033[0;31m
  ~ (   ) (   ) ~  \033[0;37m  / , _/ _ (_-< / _ \  / / _ \/  ' \/  ' \/ / _ \/ _ \ \033[0;31m
( : '~'.~.'~' :  ) \033[0;37m /_/|_|\_._/___/ .__/_/ /\_,_/_/_/_/_/_/_/_/_//_/\_, / \033[0;31m
  ~ .~ (   ) ~. ~  \033[0;37m              /_/  |___/                        /___/  \033[0;31m
   (  : '~' :  )    \033[37;100m`cat /etc/raspjamming_version`\e[0;31m
    '~ .~~~. ~'                           \033[0;37mhttp://raspjamming.gc2.at \033[0;31m
        '~'"
}

BananaPiBoardLogo() {
echo -n "\033[0;94m
 , ,\033[0;93m.-.\033[0;94m         _ Banana Pi M2 Zero
 | |\033[0;93m)))   \033[0;94m     (_)   \033[0;37m  ___                  _                  _          \033[0;94m
 | |\033[0;93mvV \033[0;94m  ___   | |   \033[0;37m / _ \___ ____ ___    (_)__  __ _  __ _  (_)__  ___  \033[0;94m
 | '_ \ | '_ \ | | \033[0;37m  / , _/ _ (_-< / _ \  / / _ \/  ' \/  ' \/ / _ \/ _ \ \033[0;94m
 | |_) || |_) || | \033[0;37m /_/|_|\_._/___/ .__/_/ /\_,_/_/_/_/_/_/_/_/_//_/\_, / \033[0;94m
 |_.__/ | .__/ |_| \033[0;37m              /_/  |___/                        /___/  \033[0;94m
        | |         \033[37;100m`cat /etc/raspjamming_version`\033[0;94m
        |_|                               \033[0;37mhttp://raspjamming.gc2.at \033[0;94m"
}


UnknownBoardLogo() {
echo -n "\033[0;33m
      _____       Unknown hardware - expect the unexpected
     / ___ \       \033[0;37m    ___                  _                  _          \033[0;33m
    ( (   ) )      \033[0;37m   / _ \___ ____ ___    (_)__  __ _  __ _  (_)__  ___  \033[0;33m
     \/  / /       \033[0;37m  / , _/ _ (_-< / _ \  / / _ \/  ' \/  ' \/ / _ \/ _ \ \033[0;33m
        ( (        \033[0;37m /_/|_|\_._/___/ .__/_/ /\_,_/_/_/_/_/_/_/_/_//_/\_, / \033[0;33m
        |_|        \033[0;37m              /_/  |___/                        /___/  \033[0;33m
         _          \033[37;100m`cat /etc/raspjamming_version`\e[0;33m
        (_)                              \033[0;37mhttp://raspjamming.gc2.at \033[0;33m"

}

GC2Logo() {
echo -n "\033[0;37m
    ______
   /     /
  / ▄███▀   ████▄
 |  ██____   ▄▄██
 |  ██    | ██▀▀   \033[1;37m GRAZER COMPUTER CLUB  \033[0;37mhttps://gc2.at
  \ ▀████ | ▀████
   \______|
"
}

GC2LogoSmall() {
echo -n "\033[0;37m
     _____
    /    /
   / ▄▀▀▀   ▀▀▀█
  |  █----. ▄▀▀   \033[1;37m GRAZER COMPUTER CLUB   \033[0;37mhttps://gc2.at
   \  ▀▀▀ | ▀▀▀▀
    \`-----´
"
}



upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
#UPTIME=`printf "%d Tag(e), %02d:%02d:%02d" "$days" "$hours" "$mins" "$secs"`
UPTIME=`printf "%d Tag(e), %d Stunde(n), %d Minute(n), %d Sekunde(n)" "$days" "$hours" "$mins" "$secs"`
MEM_TOTAL=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}` 
MEM_FREE=`cat /proc/meminfo | grep MemFree | awk {'print $2'}` 
MEM_AVAI=`cat /proc/meminfo | grep MemAvailable | awk {'print $2'}` 
MEM_TOTAL_MB=$((${MEM_TOTAL}/1024))
MEM_FREE_MB=$((${MEM_FREE}/1024))
MEM_AVAI_MB=$((${MEM_AVAI}/1024))
MEM_PERCENT=$((${MEM_AVAI}*100/${MEM_TOTAL}))
RPI_TYPE=`gpio -v | grep Type | cut -c 9-`
CPU_TEMP=`cat /sys/class/thermal/thermal_zone0/temp`
SYS_TEMP=`/usr/local/bin/w1-temp.py 2>/dev/null | cut -f 1 -d " "`
SD_SIZE=`df -h / | grep dev | awk {'print $2}'`
SD_SIZE_MB=`df / | grep dev | awk {'print $2}'`
SD_FREE=`df -h / | grep dev | awk {'print $4}'`
SD_FREE_MB=`df / | grep dev | awk {'print $4}'`
SD_PERCENT=$((${SD_FREE_MB}*100/${SD_SIZE_MB}))
HAT_PRODUCT_ID=`cat /proc/device-tree/hat/product_id 2> /dev/null | tr -d '\0'` 
HAT_PRODUCT=`cat /proc/device-tree/hat/product    2> /dev/null | tr -d '\0'` 
HAT_VENDOR=`cat /proc/device-tree/hat/vendor     2> /dev/null | tr -d '\0'` 
RASPBIAN_VERSION=`lsb_release -d | cut -f 2`

BOARD_MODEL=`cat /proc/device-tree/model`
#echo $BOARD_MODEL
case $BOARD_MODEL in
 Raspberry\ Pi* )
  RaspberryPiBoardLogo
  ;;
 Banana\ Pi\ M2\ Zero* )
  BananaPiBoardLogo
  ;;
 * )
  UnknownBoardLogo
  ;;
esac
GC2LogoSmall

echo -n "\033[0;37m"
echo "Datum:          `date +"%A, %e.%B %Y, %R (%Z)"`"
echo "Betriebssystem: ${RASPBIAN_VERSION} `uname -m`, Kernel: `uname -r`"
echo "Hardware:       ${RPI_TYPE}"
if [ -f /proc/device-tree/hat/product_id ]; then
echo "HAT:            ${HAT_PRODUCT}/${HAT_VENDOR}"
fi
if [ -f /sys/bus/w1/devices/w1_bus_master1/w1_master_slaves ]; then
echo "CPU/SYS Temp.:  $((${CPU_TEMP}/1000))°C / ${SYS_TEMP}°C"
else 
echo "CPU Temp.:      $((${CPU_TEMP}/1000))°C"
fi 
echo "Speicher frei:  ${MEM_PERCENT}% ( ${MEM_AVAI_MB}MB von ${MEM_TOTAL_MB}MB)"
echo "SD Karte frei:  ${SD_PERCENT}% ( ${SD_FREE}B von ${SD_SIZE}B)"
echo "Laufzeit:       ${UPTIME}"

