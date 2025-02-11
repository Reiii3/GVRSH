if [ $AXERON = false]; then 
    echo "Module ini hanya untuk Laxeron "
fi

$AXFUN
import axeron.prop
runPackage1="com.rezone.gvortex"

if [ -z $runPackage ]; then 
    echo "package not detected"
fi

echo "=======================================" 
echo "     Welcome To Modules Plugin GVR "
echo "=======================================" 
echo "    Developer : Reii"
echo "    version   : ${version} | ${versionCode}"
echo "    Update    : none "
echo

echo"   Running Game : ${runPackage}"
echo
echo ""