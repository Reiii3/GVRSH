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

apply () {
  echo "game: $runPackage"
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
echo

if [ -z $runPackage ]; then 
    echo "package not detected"
    exit 1
fi

echo "    Running Game : ${runPackage}"
sleep 1

apply($runPackage)

echo
echo "===================="
echo "    Open to GVR"
echo "===================="
sleep 0.5
flaunch $runPackage1
am-kill all