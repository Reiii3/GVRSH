if [ $AXERON = false ]; then 
    echo "Module ini hanya untuk Laxeron "
fi

$AXFUN
import axeron.prop
runPackage1="com.rezone.gvortex"
log_file="/data/local/tmp/install_selesai"


if [ -n "$1" ] && [ "$1" == "-p" ];then
    axprop $path_axeronprop runPackage -s "$2"
    runPackage="$2"
    shift 2
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
  echo "    Status    : [Active]"
else
  echo "    Status    : [Non Active]"
fi


if [ -z $runPackage ]; then 
    echo "package not detected"
    exit 1
fi
sleep 1
echo "======================================="
echo
echo " [Running Game : ${runPackage}]"
sleep 0.5
echo
if [ ! -f "$log_file" ]; then
    echo "          ================================"
    echo "            [Instalation System Modules]"
    echo "          ================================"
    echo
    apply
    sleep 1
    echo "" > "$log_file" # Membuat file sebagai penanda bahwa instalasi sudah dilakukan
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
 echo "   ->[Aktivasi System Driver Game]"
 sleep 1
 echo "   ->[Aktivasi System compile]"
 sleep 1
 if [ -z $renderer ]; then
   echo "   ->[Reder selection : none]"
   sleep 1
 else
   echo "   ->[Reder selection : ${renderer}]"
   sleep 1
 fi
if [ "${runPackage}" = "com.dts.freefiremax" ]; then
   echo "   ->[Optimation FreeFire]"
   sleep 0.5
fi

echo
echo "==================="
echo "    Open to GVR"
echo "==================="
echo "| Enjoy This Game |"
sleep 0.5
