if [ $AXERON = false ]; then 
    echo "Module ini hanya untuk Laxeron "
fi

$AXFUN
import axeron.prop
pkg2=$(pm list packages | grep -i "gvortex" | sed 's/package://g')
gvr="$pkg2"
lax=false
log_folder="/data/local/tmp/axeron_cash/zcek_ins"
log_sys="$log_folder/install_selesai"
dvc_ins="$log_folder/dvc"

if [ -n "$1" ] && [ "$1" == "-g" ];then
    axprop $path_axeronprop nameGame -s "$2"
    nameGame="$2"
    shift 2
    pkg=$(pm list packages | grep -i "$nameGame" | sed 's/package://g')
    runPackage="$pkg"
fi

if [ -n "$1" ] && [ "$1" == "-lx" ]; then 
   lax=true
   shift
fi 

if [ -n "$1" ] && [ "$1" == "-v" ];then
    renderer="$2"
    shift 
fi

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

fle_ins() {
    folder_path="/data/local/tmp/axeron_cash/zcek_ins"
    file_name="$1"    # Nama fil
    
    # Buat file di dalamnya
    file_path="$folder_path/$file_name"
    echo "" > "$file_path"
}

apply () {
 # Kode Optimasi Performa untuk Helio G35 ke Bawah

setprop debug.sf.hw 1
setprop debug.egl.hw 1
setprop debug.egl.sync 0
setprop debug.cpuprio 6
setprop debug.gpuprio 7
setprop debug.ioprio 7
setprop debug.performance.tuning 1
setprop debug.performance.profile 1
setprop debug.multicore.processing 1
setprop debug.systemuicompilerfilter speed

# Kode Disable AA (Anti-Aliasing) untuk Stabilitas GPU Lemah
setprop debug.egl.force_fxaa false
setprop debug.egl.force_taa false
setprop debug.egl.force_msaa false
setprop debug.egl.force_ssaa false
setprop debug.egl.force_smaa false
setprop debug.egl.force_mlaa false
setprop debug.egl.force_txaa false
setprop debug.egl.force_csaa false

# Kode Support Perf/Render
setprop debug.renderengine.backend skiavk
setprop debug.hwui.render_performance true
cmd thermalservice override-status 0
cmd power set-adaptive-power-saver-enabled false
cmd power set-mode 0

# Kode Render Perf
setprop debug.hwui.disable_draw_defer true
setprop debug.hwui.disable_draw_reorder true
setprop debug.hwui.render_dirty_regions false
setprop debug.hwui.skip_empty_damage true
setprop debug.hwui.disable_vsync true
setprop debug.hwui.fps_divisor 1
setprop debug.hwui.render_thread true
setprop debug.hwui.render_thread_count 1
}

apply2 () {
 
}

if [ $lax = false ]; then

    echo "=======================================" 
    printer "     Welcome To Modules Plugin GVR "
    echo "=======================================" 
    sleep 0.5
    printer "    Developer : Reii"
    sleep 0.5
    printer "    Version   : ${version} | ${versionCode}"
    sleep 0.5
    printer "    Update    : none"
    sleep 0.5
    if [ -f "$log_sys" ]; then
      printer "    Status    : [Active]"
    else
      printer "    Status    : [Non Active]"
    fi
    
    if [ "$gvr" = "com.rezone.gvortex" ]; then 
       printer "    GVR       : [Detected]"
    else 
       printer "    GVR       : [Not Detected]"
    fi
    sleep 1
    echo "=======================================" 
    echo

else

    echo "===================================" 
    printer "     Welcome To Modules laxeron "
    echo "==================================="
    sleep 0.5
    printer "    Developer : Reii"
    sleep 0.5
    printer "    Version   : ${version} | ${versionCode}"
    sleep 0.5
    printer "    Update    : none"
    sleep 0.5
    if [ -f "$log_sys" ]; then
      printer "    Status    : [Active]"
    else
      printer "    Status    : [Non Active]"
    fi
    
    if [ "$gvr" = "com.rezone.gvortex" ]; then 
       printer "    GVR       : [Detected]"
    else 
       printer "    GVR       : [Not Detected]"
    fi
    sleep 1
    echo "==================================="
    echo
fi

if [ -z $runPackage ]; then 
     echo "package not detected"
    exit 1
fi

if [ ! -f "$log_folder" ]; then
    mkdir -p "$log_folder" # Membuat folder untul menyimpan file penanda
    sleep 1
fi 

printer " [Running Game : [${nameGame}]"
sleep 0.5
echo
if [ ! -f "$log_sys" ]; then
    echo "          ================================"
    sleep 0.5
    printer "            [Instalation System Modules]"
    sleep 1
    printer "              Update Status : [Active]"
    printer "            [System Modules Sudah Aktif]"
    sleep 0.5
    echo "          ================================"
    echo
    apply
    sleep 1
    fle_ins "install_selesai" # Membuat file sebagai penanda bahwa instalasi sudah dilakukan
else
    echo "          ================================"
    sleep 0.5
    printer "            [System Modules Sudah Aktif]"
    sleep 0.5
    echo "          ================================"
    sleep 1.5
    echo
fi

 echo "   ============================="
 sleep 0.5
 printer "     [Penyesuaian System Game]"
 sleep 0.5
 echo "   ============================="
 sleep 0.5
 echo
 echo "   [$nameGame]->[Aktivasi System Driver Game]"
 sleep 1
 echo "   [$nameGame]->[Aktivasi System compile]"
  cmd package compile -m speed --secondary-dex -f ${runPackage} > /dev/null 2>&1
 sleep 1
 if [ -z $renderer ]; then
   echo "   [$nameGame]->[Reder selection : none]"
   sleep 1
 else
   echo -n "   [$nameGame]->[Reder selection : "
   sleep 0.5
   printer "${renderer}]"
   sleep 1
   setprop debug.hwui.renderer $renderer
 fi
 if [ "${runPackage}" = "com.dts.freefiremax" ]; then
   echo "   [$nameGame]->[Optimation FreeFire Max]"
     if [ ! -f "$dvc_ins"]; then
      device_config put game_overlay ${runPackage} mode=2,${renderer}=1,downscaleFactor=0.7,fps=60:mode=3,${renderer}=0,downscaleFactor=0.9,fps=60
      sleep 1
      echo "" > "$dvc_ins" # Membuat file Penanda Bahwa Downscale Telah dilakukan
     fi
 elif [ "$runPackage" = "com.dts.freefireth" ]; then
   echo "   [$nameGame]->[Optimation FreeFire]"
     if [ ! -f "$dvc_ins" ]; then
      device_config put game_overlay com.dts.freefireth mode=2,${renderer}=1,downscaleFactor=0.7,fps=60:mode=3,${renderer}=0,downscaleFactor=0.9,fps=60
      sleep 1
      echo "" > "$dvc_ins" # Membuat file Penanda Bahwa Downscale Telah dilakukan
     fi
 fi 
 
 echo "   [$nameGame]->[Comming Soon Next Update]"
sleep 0.5

if [ $lax = false ]; then
    echo
    echo "==================="
    sleep 0.5
    printer "    Open to GVR"
    sleep 0.5
    echo "==================="
    sleep 0.5
    printer "| Enjoy This Game |"
    sleep 1 
    echo 
    toast  "Open GVR | ${nameGame}"
    sleep 1 
    flaunch $gvr
else
    echo
    echo "====================="
    sleep 0.5
    printer "   Open to Laxeron"
    sleep 0.5
    echo "====================="
    sleep 0.5
    printer "| All Features LAxeron Active |"
    printer "      | Enjoy This Game |"
    printer "      |  Open This Game |"
    sleep 1
    flaunch $runPackage
fi
