# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

COMMON_GLOBAL_CFLAGS += -DLGE_MSM8960 -DNEED_UMS_ENABLE -DENABLE_UMS_WITH_DATAMEDIA

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true



# PMEM compatibility
BOARD_NEEDS_MEMORYHEAPPMEM := true

# Init
TARGET_PROVIDES_INIT_RC := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_ION_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# FM radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFAGS += -DHAVE_FM_RADIO

# QCOM GPS
#BOARD_USES_QCOM_GPS := true

# Graphics
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
#TARGET_HAVE_BYPASS := false
#TARGET_USES_OVERLAY := true
#TARGET_QCOM_HDMI_OUT := true
BOARD_EGL_CFG := device/lge/msm8960-common/configs/egl.cfg

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true


# Flags for Krait CPU
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
ifneq ($(VARIENT_REQUIRE_3.0_KERNEL),true)
COMMON_GLOBAL_CFLAGS += -DNEW_ION_API
endif
TARGET_CPU_VARIANT := krait

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH_VARIANT_CPU := cortex-a9

TARGET_QCOM_DISPLAY_VARIANT := caf

#BOARD_SEPOLICY_DIRS += \
#        device/lge/msm8960-common/sepolicy
		
#BOARD_SEPOLICY_UNION += \
#	genfs_contexts \
#	app.te \
#	bluetooth.te \
#	device.te \
#	domain.te \
#	drmserver.te \
#	file.te \
#	file_contexts \
#	hci_init.te \
#	init_hell.te \
#	keystore.te \
#	mediaserver.te \
#	kickstart.te \
#	rild.te \
#	surfaceflinger.te \
#	system.te \
#	ueventd.te \
#	wpa.te
