## ADB Keys
# Android
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys

PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Bash
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system/xbin/bash

## Pixel Apps
include vendor/extra/apps/GoogleApps.mk

## ih8sn
$(call inherit-product-if-exists, ih8sn/product.mk)

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://nextcloud.althafvly.com/s/lineage_{device}/download"

## Signing
ifeq ($(USE_DEV_CERTIFICATE),true)
DEV_DEVICE=$(shell echo $(TARGET_PRODUCT) | cut -d'_' -f2-)
ifneq ($(wildcard keys/$(DEV_DEVICE)/.*),)
DEFAULT_SYSTEM_DEV_CERTIFICATE := keys/$(DEV_DEVICE)/releasekey
endif
endif
