#!/system/bin/sh

echo Tweak Performance SM-A037F
#Set Power High Performance
echo -e "\e[31mEnable Power High Performance\e[0m"
cmd power set-mode 1
cmd power set-fixed-performance-mode-enabled true
cmd power set-adaptive-power-saver-enabled false

#OC CPU
echo -e "\e[32mSet Overclock Max CPU\e[0m"
echo 1 2300000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 1 2300000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
echo 0 2900000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 0 2900000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

#Set Scheduling Mode Performance
echo -e "\e[34mSet CPU Scheduling Mode Performance\e[0m"
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo "performance" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor

#Disable Thermal
echo -e "\e[33mDisable Thermal\e[0m"
stop thermal
stop thermald
stop thermal_manager
stop thermalloadalgod
stop vendor.thermal-hal-2-0.mtk

#FPS Booster
echo -e "\e[36mEnable FPS Booster\e[0m"
setprop persist.sys.NV_FPSLIMIT 120
setprop persist.sys.NV_POWERMODE 1
setprop persist.sys.NV_PROFVER 15
setprop persist.sys.NV_STEREOCTRL 0
setprop persist.sys.NV_STEREOSEPCHG 0
setprop persist.sys.NV_STEREOSEP 20

#Smooth UI
echo -e "\e[32mSet Smooth UI and Touch Responsive\e[0m"
setprop persist.service.lgospd.enable 0
setprop persist.service.pcsync.enable 0
setprop windowsmgr.max_events_per_sec 1
setprop touch.presure.scale 0.0001
setprop debug.egl.swapinterval -60

#Acceleration Performance
echo -e "\e[33mEnable Acceleration Performance\e[0m"
setprop debug.composition.type gpu
setprop debug.performance.tuning 1
setprop hwui.disable_vsync true
setprop debug.sf.hw 1
setprop hw3d.force 1
setprop hw2d.force 1
setprop video.accelerate.hw 1

#Ram Optimization
echo -e "\e[31mEnable Ram Optimization\e[0m"
setprop persist.sys.purgeable_assets 1
setprop dalvik.vm.verify-bytecode false
setprop debug.kill_allocating_task 0
setprop ENFORCE_PROCESS_LIMIT false

#Renderer SKIAGL
echo -e "\e[36mSet Renderer SKIAGL\e[0m"
setprop debug.hwui.renderer skiagl

#PPM
echo -e "\e[31mSystem Booster Performance Enable\e[0m"
echo 1 > /proc/ppm/enabled
echo 0 0 > /proc/ppm/policy_status
echo 1 0 > /proc/ppm/policy_status
echo 2 0 > /proc/ppm/policy_status
echo 3 0 > /proc/ppm/policy_status
echo 4 0 > /proc/ppm/policy_status
echo 5 0 > /proc/ppm/policy_status
echo 6 0 > /proc/ppm/policy_status
echo 7 0 > /proc/ppm/policy_status
echo 8 0 > /proc/ppm/policy_status
echo 9 1 > /proc/ppm/policy_status

echo Set Mode Performance Success
