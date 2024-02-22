#!/system/bin/sh

#Scheduling Mode Powersave
echo -e "\e[31mSet CPU Scheduling Mode Powersave\e[0m"
echo 2 > /proc/cpufreq/cpufreq_power_mode
cat /proc/cpufreq/cpufreq_power_mode
echo "powersave" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "powersave" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor 

#Enable Thermal
echo -e "\e[32mEnable Thermal\e[0m"
start thermal
start thermald
start thermal_manager
start thermalloadalgod
start vendor.thermal-hal-2-0.mtk

# PPM
echo -e "\e[33mSystem Boost Performance Disable\e[0m"
echo 1 > /proc/ppm/enabled
echo 0 1 > /proc/ppm/policy_status
echo 1 1 > /proc/ppm/policy_status
echo 2 1 > /proc/ppm/policy_status
echo 3 1 > /proc/ppm/policy_status
echo 4 1 > /proc/ppm/policy_status
echo 5 1 > /proc/ppm/policy_status
echo 6 1 > /proc/ppm/policy_status
echo 7 1 > /proc/ppm/policy_status
echo 8 1 > /proc/ppm/policy_status
echo 9 0 > /proc/ppm/policy_status

# Underclock CPU
echo -e "\e[35mUnderclock CPU"
echo 1 1300000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 1 1300000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
echo 0 9000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 0 9000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

#Power Save
echo -e "\e[31mSet PowerSave mode\e[0m"
cmd power set-mode 1
cmd power set-adaptive-power-saver-enabled true
cmd power set-fixed-performance-mode-enabled false

echo Success Set Mode Powersave
