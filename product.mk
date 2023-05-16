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

## fastbootd
PRODUCT_PACKAGES += fastbootd
PRODUCT_SYSTEM_PROPERTY_OVERRIDES += ro.fastbootd.available=true

## ih8sn
$(call inherit-product-if-exists, ih8sn/product.mk)

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://nextcloud.althafvly.com/s/lineage_{device}/download"
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.recovery_update=true

## Signing
ifeq ($(USE_DEV_CERTIFICATE),true)
ifneq ($(wildcard keys/$(subst lineage_,,$(TARGET_PRODUCT))/.*),)
PRODUCT_DEFAULT_DEV_CERTIFICATE := keys/$(subst lineage_,,$(TARGET_PRODUCT))/releasekey
endif
endif

## SUW
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.allow_downgrading=true
