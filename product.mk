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

## Google Fonts
include vendor/extra/google-fonts/GoogleFonts.mk

## fastbootd
PRODUCT_PACKAGES += fastbootd
PRODUCT_SYSTEM_PROPERTY_OVERRIDES += ro.fastbootd.available=true

## ih8sn
ifeq ($(WITH_GMS),true)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc

PRODUCT_PACKAGES += ih8sn

ifneq ("$(wildcard  vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf)","")
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf:/system/etc/ih8sn.conf
else
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf
endif

# Pixel
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/sysconfig/pixel_2016_exclusive.xml

PRODUCT_COPY_FILES += \
    vendor/extra/configs/pixel/sysconfig/pixel_2016_exclusive.xml:system/etc/sysconfig/pixel_2016_exclusive.xml

endif # WITH_GMS

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
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

ifeq ($(WITH_GMS),true)
ifneq ($(PRODUCT_IS_ATV),true)
-include vendor/google_pixel/product.mk
endif # PRODUCT_IS_ATV
endif # WITH_GMS
