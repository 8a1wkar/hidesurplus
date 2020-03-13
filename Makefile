ARCHS = armv7 arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideSurplus

HideSurplus_FILES = Tweak.x
HideSurplus_CFLAGS = -fobjc-arc
HideSurplus_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += HideSurplusprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
