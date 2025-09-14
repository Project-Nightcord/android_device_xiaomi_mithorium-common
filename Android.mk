#
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_USES_XIAOMI_MITHORIUM_COMMON_TREE),true)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_MODULE := mithorium_product_packages
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_FAKE)
LOCAL_REQUIRED_MODULES := $(MITHORIUM_PRODUCT_PACKAGES)
include $(BUILD_PHONY_PACKAGE)

endif
