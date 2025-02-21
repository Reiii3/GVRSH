if [ $AXERON = false ]; then
   echo "Support From Laxeron"
fi

$AXFUN
import axeron.prop
log_folder="/data/local/tmp/axeron_cash/zcek_ins"
log_file="$log_folder/install_selesai"

printer() {
text="$1"
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "${text:$i:1}"
 sleep 0.02
   i=$((i + 1))
 done
echo
}

refact() {
prop="$1"
  resetprop -p "$prop"
}

echo "=======================================" 
sleep 0.5
printer "     Welcome To Modules Plugin GVR "
sleep 0.5
echo "=======================================" 
sleep 0.5
printer "    Developer : Reii"
sleep 0.5
printer "    Version   : ${version} | ${versionCode}"
sleep 0.5
printer "    Update    : none "
sleep 0.5
if [ -f "$log_file" ]; then
  printer "    Status    : [Active]"
else  
  printer "    Status    : [Non Active]"
fi
sleep 0.5
echo "======================================="
sleep 0.7
echo
echo " [Remove Game: ${nameGame}]"
sleep 0.5
echo

if [ -d "$log_folder" ]; then
     echo "      =================================="
     sleep 0.5
     printer "          [Disabling System Modules]"
     sleep 0.5
     echo "      =================================="
     sleep 1
     rm -rf $log_folder
fi

if [ ! -d "$log_folder" ]; then
     echo "      =================================="
     sleep 0.5
     printer "         Update Status : [Non Active]"
     sleep 0.5
     echo "      =================================="
else
     echo "      ==================================="
     sleep 0.5
     printer "       Update Status : [Failed Disabled]"
     sleep 0.5
     echo "      ==================================="
fi
echo
sleep 1

echo " ============================"
sleep 0.5
printer "   Disable Game Adjustments"
sleep 0.5
echo " ============================"
sleep 1
echo
echo " [$nameGame]->[Removed System Driver]"
sleep 0.5
echo " [$nameGame]->[Removed Compile System]"
sleep 0.5
echo " [$nameGame]->[Render Default System]"
sleep 0.5
echo " [$nameGame]->[Removed All Fetures]"
sleep 1
echo

printer "| Thank you for using my module |"
sleep 0.5
printer "             Enjoy "