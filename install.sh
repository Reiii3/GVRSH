if [ $AXERON = false ]; then 
    echo "Module ini hanya untuk Laxeron "
fi

$AXFUN
import axeron.prop
runPackage1="com.rezone.gvortex"

if [ -n "$1" ] && [ "$1" == "-p" ];then
    axprop $path_axeronprop runPackage -s "$2"
    runPackage="$2"
    shift 2
fi


echo "=======================================" 
echo "     Welcome To Modules Plugin GVR "
echo "=======================================" 
echo "    Developer : Reii"
echo "    version   : ${version} | ${versionCode}"
echo "    Update    : none "
echo

if [ -z $runPackage ]; then 
    echo "package not detected"
    exit 1
fi

echo "    Running Game : ${runPackage}"
echo
echo "===================="
echo "    Open to GVR"
echo "===================="
flaunch $runPackage1