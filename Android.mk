#
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_USES_XIAOMI_MITHORIUM_COMMON_TREE),true)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

CNE_LIBS := libvndfwk_detect_jni.qti.so
CNE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64/,$(notdir $(CNE_LIBS)))
$(CNE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CneApp lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CNE_SYMLINKS)

include $(CLEAR_VARS)
LOCAL_MODULE := mithorium_product_packages
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_FAKE)
LOCAL_REQUIRED_MODULES := $(MITHORIUM_PRODUCT_PACKAGES)
include $(BUILD_PHONY_PACKAGE)

endif
