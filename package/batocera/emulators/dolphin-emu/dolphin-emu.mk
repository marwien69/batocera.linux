################################################################################
#
# DOLPHIN EMU
#
################################################################################
# Version: Commits on Sep 30, 2020 - 5.0-12716
DOLPHIN_EMU_VERSION = 31524288e3b2450eaefff8202c6d26c4ba3f7333
DOLPHIN_EMU_SITE = $(call github,dolphin-emu,dolphin,$(DOLPHIN_EMU_VERSION))
DOLPHIN_EMU_LICENSE = GPLv2+
DOLPHIN_EMU_DEPENDENCIES = libevdev ffmpeg zlib libpng lzo libusb libcurl bluez5_utils qt5base hidapi xz host-xz

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
DOLPHIN_EMU_DEPENDENCIES += xserver_xorg-server
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDN2)$(BR2_PACKAGE_BATOCERA_TARGET_VIM3),y)
DOLPHIN_EMU_DEPENDENCIES += libdrm
endif

DOLPHIN_EMU_SUPPORTS_IN_SOURCE_BUILD = NO

DOLPHIN_EMU_CONF_OPTS  = -DTHREADS_PTHREAD_ARG=OFF
DOLPHIN_EMU_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
DOLPHIN_EMU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOLPHIN_EMU_CONF_OPTS += -DENABLE_EGL=OFF
DOLPHIN_EMU_CONF_OPTS += -DDISTRIBUTOR='batocera.linux'

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDN2)$(BR2_PACKAGE_BATOCERA_TARGET_VIM3),y)
DOLPHIN_EMU_CONF_OPTS += -DENABLE_EGL=ON
DOLPHIN_EMU_CONF_OPTS += -DENABLE_LTO=ON
endif

$(eval $(cmake-package))
