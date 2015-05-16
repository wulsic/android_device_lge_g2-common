#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=g2 user_debug=31 msm_rtb.filter=0x0 mdss_mdp.panel=1:dsi:0:qcom,mdss_dsi_g2_lgd_cmd
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x05000000 --tags_offset 0x04800000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := device/lge/g2-common/releasetools/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/lge/msm8974

BOARD_USES_ALSA_AUDIO:= true

TARGET_BOOTLOADER_BOARD_NAME := galbi
TARGET_BOARD_PLATFORM := msm8974

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"

BOARD_EGL_CFG := device/lge/g2-common/configs/egl.cfg

USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_C2D_COMPOSITION := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Audio
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_HAVE_LOW_LATENCY_AUDIO := true

RECOVERY_FSTAB_VERSION = 2
TARGET_RECOVERY_FSTAB = device/lge/g2-common/rootdir/etc/fstab.g2
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560 # 2.5G (actually 2.75, but leave room for model variation)

BOARD_USERDATAIMAGE_PARTITION_SIZE := 6189744128 # 5.9G
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/g2-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/lge/g2-common/bluetooth/vnd_g2.txt

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_NO_RPC := true

BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_HARDWARE_CLASS := device/lge/g2-common/cmhw/

# SELinux policies
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/lge/g2-common/sepolicy

BOARD_RIL_CLASS := ../../../device/lge/g2-common/ril/
#TARGET_RELEASETOOLS_EXTENSIONS := device/lge/g2-common/releasetools

COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'
BOARD_USES_QC_TIME_SERVICES := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

TARGET_USES_LOGD := false

TARGET_SPECIFIC_HEADER_PATH := device/lge/g2-common/include

BOARD_USES_LEGACY_MMAP := true

###                                     ###
### Specific Options for TWRP Building  ###
###                                     ###

# Common Options
RECOVERY_VARIANT := twrp
DEVICE_RESOLUTION := 1080x1920
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.175/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
TW_INCLUDE_L_CRYPTO := true
TARGET_RECOVERY_INITRC := device/lge/g2-common/twrp/init.rc

# Post recovery boot script
PRODUCT_COPY_FILES += device/lge/g2-common/twrp/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Enable f2fs filesystem tools
TARGET_USERIMAGES_USE_F2FS := true

##  Functions to properly set config and files based on existence of an External SD Card
# Board has an External SD Card (i.e. f320 or lgl22)
ifneq ($(filter f320 lgl22,$(TARGET_DEVICE)),)
    BOARD_HAS_NO_REAL_SDCARD := false
    TW_EXTERNAL_STORAGE_PATH := "/external_sd"
    TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

    PRODUCT_COPY_FILES += device/lge/g2-common/twrp/twrp.g2.has_sd.fstab:recovery/root/etc/twrp.fstab
    PRODUCT_COPY_FILES += device/lge/g2-common/twrp/init.recovery.sd_card.rc:recovery/root/init.recovery.sd_card.rc

# OR
# Board does not have an External SD Card
else
    BOARD_HAS_NO_REAL_SDCARD := true
    PRODUCT_COPY_FILES += device/lge/g2-common/twrp/twrp.g2.no_sd.fstab:recovery/root/etc/twrp.fstab
endif

# MultiROM
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/lge/g2-common/multirom/mr_init_devices.c
MR_RD_ADDR := 0x05200000
MR_DPI := xhdpi
MR_DPI_MUL := 1.5
MR_FSTAB := device/lge/g2-common/twrp/twrp.g2.no_sd.fstab
MR_DPI_FONT := 340
MR_KEXEC_MEM_MIN := 0x04000000
MR_KEXEC_DTB := true
MR_USE_MROM_FSTAB := true
MR_DEVICE_HOOKS_VER := 4
MR_DEVICE_HOOKS := device/lge/g2-common/multirom/mr_hooks.c
MR_CONTINUOUS_FB_UPDATE := true
MR_PIXEL_FORMAT := "RGB_565"
