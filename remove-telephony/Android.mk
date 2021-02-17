LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := remove-telephony
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := CarrierServicesGoogle Dialer GoogleDialer Messages Messaging Telecom Telephony
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SRC_FILES := /dev/null
LOCAL_CERTIFICATE := PRESIGNED
include $(BUILD_PREBUILT)
