# Product
ifneq ($(filter %bonito %sargo %crosshatch %blueline %flame %coral,$(TARGET_PRODUCT)),)
    TARGET_COPY_OUT_PRODUCT := product
else
    TARGET_COPY_OUT_PRODUCT := system/product
endif

## SELinux
BOARD_SEPOLICY_DIRS += vendor/extra/sepolicy
