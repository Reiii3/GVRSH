if [ $AXERON = false ]; then
   echo "Support From Laxeron"
fi

$AXFUN
import axeron.prop
log_folder="/data/local/tmp/axeron_cash/zcek_ins"
log_file="$log_folder/install_selesai"

echo "=======================================" 
echo "     Welcome To Modules Plugin GVR "
echo "=======================================" 
sleep 0.5
echo "    Developer : Reii"
sleep 0.5
echo "    Version   : ${version} | ${versionCode}"
sleep 0.5
echo "    Update    : none "
sleep 0.5
if [ -f "$log_file" ]; then
  echo "    Status    : [Active]"
else  
  echo "    Status    : [Non Active]"
fi
sleep 1
echo "======================================="
echo
echo " [Remove Game: ${nameGame}]"
sleep 0.5
echo

if [ -d "$log_folder" ]; then
     echo "      =================================="
     echo "          [Disabling System Modules]"
     echo "      =================================="
     sleep 1
     rm -rf $log_folder
fi

if [ ! -d "$log_folder" ]; then
     echo "      =================================="
     echo "         Update Status : [Non Active]"
     echo "      =================================="
else
     echo "      Update Status : [Failed Disabled]"
     echo "      =================================="
fi
echo
sleep 1

echo " ============================"
echo "   Disable Game Adjustments"
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

echo "| Thank you for using my module |"
echo "             Enjoy "