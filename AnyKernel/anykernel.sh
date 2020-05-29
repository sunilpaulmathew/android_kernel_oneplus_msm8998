# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=SmartPack-Kernel by sunilpaulmathew@xda-developers.com
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=OnePlus5T
device.name2=dumpling
device.name3=OnePlus5
device.name4=cheeseburger
device.name5=
supported.versions=10
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;

if [ -e $ramdisk/kernel_profiler ]; then
        # Inject Kernel Profiler support
        if [ -e $ramdisk/kernel_profiler/banner.png ]; then
                mv $ramdisk/kernel_profiler/banner.png /sdcard/
        fi
	if [ -e /data/kernel_profiler ]; then
	        # Remove old files
		rm -rf /data/kernel_profiler/*
		mv $ramdisk/kernel_profiler/* /data/kernel_profiler/
	else
        	mv $ramdisk/kernel_profiler/ /data/
	fi
fi

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc

# init.tuna.rc

# fstab.tuna

# end ramdisk changes

write_boot;
## end install
