#
# Copyright (C) 2016 The Sayanogen Project
# Copyright (C) 2017 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/kccat6/kccat6-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOTANIMATION_HALF_RES := true

# Ubuntu Touch additional packages    

PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    android.hardware.media.omx@1.0-impl \
    android.hardware.health@1.0 \
    android.hardware.gnss@1.1 \
    android.hardware.keymaster@4.0 \
    rild \
    libnetutils \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.2

### Ubuntu Touch ###
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/70-kccat6.rules:system/halium/lib/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/ubuntu/kccat6.yaml:system/halium/etc/deviceinfo/default.yaml \
    $(LOCAL_PATH)/ubuntu/touch.pa:system/halium/etc/pulse/touch.pa \
    $(LOCAL_PATH)/ubuntu/ril_subscription.conf:system/halium/etc/ofono/ril_subscription.conf \
    $(LOCAL_PATH)/ubuntu/repowerd.override:system/halium/etc/init/repowerd.override \
    $(LOCAL_PATH)/ubuntu/crash_dump.arm.policy:system/etc/seccomp_policy/crash_dump.arm.policy
    #$(LOCAL_PATH)/ubuntu/android.conf:system/halium/etc/ubuntu-touch-session.d/android.conf 
### End Ubuntu Touch ###

# common apq8084
$(call inherit-product, device/samsung/apq8084-common/apq8084.mk)
