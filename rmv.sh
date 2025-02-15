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
  echo "    Status    : [Non Active]"
else 
  echo "    Status    : [Active]"
fi
sleep 1
echo "======================================="
echo
echo " Rmoved Game : ${runPackage}"