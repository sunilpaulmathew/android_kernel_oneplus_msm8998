#!/system/bin/sh

# Description=Default SmartPack-Kernel profile optimized for a balanced experience.

# configure governor settings for little cluster
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo "70 672000:45 825600:50 1036800:60 1248000:70 1478400:85" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 80000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
echo 79000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

# configure governor settings for big cluster
echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "19000 1400000:39000 1700000:19000 2100000:79000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
echo 19000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
echo 99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo "85 1728000:80 2112000:90 2342400:95" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 1574400 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 80000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
echo 39000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load

# GPU settings
echo 1 > /sys/class/kgsl/kgsl-3d0/devfreq/adrenoboost

# Display settings
echo 1000 > /sys/class/leds/lcd-backlight/max_brightness
echo 1 > /sys/module/klapse/parameters/enabled_mode

# IO settings
echo 128 > /sys/block/sda/queue/nr_requests
echo 1 > /sys/block/sda/queue/iostats
echo 128 > /sys/block/sde/queue/nr_requests
echo 1 > /sys/block/sde/queue/iostats

# Misc settings
echo 1856 > /sys/class/timed_output/vibrator/vtg_level

# The END
