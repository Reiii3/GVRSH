if [ $AXERON = false ]; then
   echo "Support From Laxeron"
fi

$AXFUN
import axeron.prop
log_file="/data/local/tmp/install_selesai"

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
echo " [Remove Game: ${runPackage}]"
sleep 0.5
echo

if [ ! -f "$log_file" ]; then
     echo "      ================================"
     echo "       [Disabling System Modules]"
     echo "      ================================"
     echo

     sleep 1

     rm $log_file
fi

echo "================================"
if [ -f "$log_file" ]; then
    echo " Checking Status : [Non Active]"
else
    echo " Checking Status : [Failed Disabled]"
fi
echo "================================"
echo

echo "     ============================"
echo "       Disable Game Adjustments"
echo "     ============================"
echo

echo "| Thank you for using my module |"
echo "             Enjoy "