### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=KernelSU for Mi 3 (cancro) PowerBy DeepSea
do.devicecheck=1
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=cancro
device.name2=MI3W
device.name3=MI3C
device.name4=MI4
device.name5=xiaomi3
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
# AK3 会自动识别 boot 分区路径，填 auto 即可（兼容 msm8974 各类 ROM）
BLOCK=auto;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # 解包原本 boot.img 中的 ramdisk

write_boot; # 将你编译好的 zImage 与原厂 ramdisk 重新缝合并写入 boot 分区
## end boot install