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
echo "    version   : ${version} | ${versionCode}"
sleep 0.5
echo "    Update    : none "
sleep 0.5


if [ -z $runPackage ]; then 
    echo "package not detected"
    exit 1
fi

echo "  [Running Game : ${runPackage}]"
echo
sleep 1


if [ ! -f "$log_file" ]; then
    echo "          ================================"
    echo "            [Instalation System Modules]"
    echo "          ================================"
    apply
    sleep 1.5
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
 echo
 echo "   ->[Aktivasi System Driver Game]"
 echo "   ->[Aktivasi System compile]"


echo
echo "===================="
echo "    Open to GVR"
echo "===================="
sleep 0.5
