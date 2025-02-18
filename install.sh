if [ $AXERON = false ]; then 
    echo "Module ini hanya untuk Laxeron "
fi

$AXFUN
import axeron.prop
pkg2=$(pm list packages | grep -i "gvortex" | sed 's/package://g')
gvr="$pkg2"
log_folder="/data/local/tmp/axeron_cash/zcek_ins"
log_sys="$log_folder/install_selesai"

if [ -n "$1" ] && [ "$1" == "-g" ];then
    axprop $path_axeronprop nameGame -s "$2"
    nameGame="$2"
    shift 2
    pkg=$(pm list packages | grep -i "$nameGame" | sed 's/package://g')
    runPackage="$pkg"
fi


if [ -n "$1" ] && [ "$1" == "-v" ];then
    renderer="$2"
    shift 
fi

apply () {
 
}

apply2 () {
 
}

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
  echo -n "    Status    : "
  sleep 0.5
  echo "[Active]"
else
  echo -n "    Status    : "
  sleep 0.5
  echo "[Non Active]"
fi

if [ "$gvr" = "com.rezone.gvortex" ]; then 
   echo -n "    GVR : "
   sleep 0.5
   echo "[Detected]"
else 
   echo -n "    GVR : "
   sleep 0.5
   echo "[Not Detected]"
fi

if [ -z $runPackage ]; then 
     echo "package not detected"
    exit 1
fi

sleep 1
echo "======================================="
echo

if [ ! -f "$log_folder" ]; then
    mkdir -p "$log_folder" # Membuat folder untul menyimpan file penanda
    sleep 1
fi 

echo -n " [Running Game : "
sleep 0.5
echo "${nameGame}]"
sleep 0.5
echo
if [ ! -f "$log_sys" ]; then
    echo "          ================================"
    echo "            [Instalation System Modules]"
    echo -n "              Update Status : "
    sleep 1
    echo "[Active]"
    echo "          ================================"
    echo
    apply
    sleep 1
    echo "" > "$log_sys" # Membuat file sebagai penanda bahwa instalasi sudah dilakukan
else
    echo "          ================================"
    echo "            [System Modules Sudah Aktif]"      
    echo "          ================================"
    sleep 1.5
    echo
fi

 echo "   ============================="
 echo "     [Penyesuaian System Game]"
 echo "   ============================="
 sleep 0.5
 echo
 echo "   [$nameGame]->[Aktivasi System Driver Game]"
 sleep 1
 echo "   [$nameGame]->[Aktivasi System compile]"
 sleep 1
 if [ -z $renderer ]; then
   echo "   [$nameGame]->[Reder selection : none]"
   sleep 1
 else
   echo -n "   [$nameGame]->[Reder selection : "
   sleep 0.5
   echo "${renderer}]"
   sleep 1
 fi
 if [ "${runPackage}" = "com.dts.freefiremax" ]; then
   echo "   [$nameGame]->[Optimation FreeFire Max]"
   device_config put game_overlay ${runPackage} mode=2,${renderer}=1,downscaleFactor=0.7,fps=60:mode=3,vulkan=0,downscaleFactor=0.9,fps=60
   sleep 1
 elif [ "$runPackage" = "com.dts.freefireth" ]; then
   echo "   [$nameGame]->[Optimation FreeFire]"
   device_config put game_overlay ${runPackage} mode=2,${renderer}=1,downscaleFactor=0.7,fps=60:mode=3,vulkan=0,downscaleFactor=0.9,fps=60
   sleep 1
 fi 
 
 echo "   [$nameGame]->[Comming Soon Next Update]"
sleep 0.5

echo
echo "==================="
echo "    Open to GVR"
echo "==================="
echo "| Enjoy This Game |"
sleep 1 
echo 

toast  "Open GVR | Enjoy"