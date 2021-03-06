LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v13

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := DSPManager

LOCAL_OVERRIDES_PACKAGES := MusicFX AudioFX

LOCAL_REQUIRED_MODULES := libcyanogen-dsp

ifeq ($(TARGET_ENABLE_DIRAC_AUDIO),true)
  LOCAL_REQUIRED_MODULES += libdirac
endif

LOCAL_PRIVILEGED_MODULE := true

LOCAL_CERTIFICATE := platform

include $(BUILD_PACKAGE)

# Use the folloing include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))
