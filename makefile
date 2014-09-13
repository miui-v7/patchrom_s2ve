#
# Makefile for i9105
#

PORT_PRODUCT := s2ve

# The original zip file, MUST be specified by each product
local-zip-file := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_i9105.zip


# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

# All apks from MIUI
local-miui-removed-apps := BaiduNetworkLocation Email GameCenter GameCenterSDKService O2O PaymentService SuperMarket VoiceAssist

local-miui-removed-priv-apps := MediaProvider

local-miui-modified-apps := ContactsProvider MiuiHome Settings QuickSearchBox

# Config density for co-developers to use the aaps with HDPI or XHDPI resource,
# Default configrations are HDPI for ics branch and XHDPI for jellybean branch
local-density := HDPI

# All apps need to be removed from original ZIP file

include phoneapps.mk

# To include the local targets before and after zip the final ZIP file,
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets

local-pre-zip := local-zip-misc
local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

local-zip-misc:
	@echo Update boot.img
	cp other/boot.img $(ZIP_DIR)/boot.img
	
	@echo Update build.prop
	cp other/build.prop $(ZIP_DIR)/system/build.prop
	
	@echo Update bootanimation.zip
	cp other/system/media/bootanimation.zip $(ZIP_DIR)/system/media/bootanimation.zip
	
	@echo Replace app
	cp other/system/app/* $(ZIP_DIR)/system/app/
	
	@echo Replace custom lib
	cp -rf other/system/lib/* $(ZIP_DIR)/system/lib/
	
	@echo Replace custom bin
	cp other/system/bin/* $(ZIP_DIR)/system/bin/
	
	@echo Replace custom etc
	cp other/system/etc/* $(ZIP_DIR)/system/etc/
	
	@echo Replace custom xbin
	cp other/system/xbin/* $(ZIP_DIR)/system/xbin/
	
	@echo Delete some unneeded files
	rm -rf $(ZIP_DIR)/data/miui/apps/ota-MiuiForum.apk
	rm -rf $(ZIP_DIR)/system/addon.d/*
	rm -rf $(ZIP_DIR)/system/bin/applypatch
	rm -rf $(ZIP_DIR)/system/bin/clearpad_fwloader
	rm -rf $(ZIP_DIR)/system/bin/recovery
	rm -rf $(ZIP_DIR)/system/etc/.has_su_daemon
	rm -rf $(ZIP_DIR)/system/etc/init.d/*
	rm -rf $(ZIP_DIR)/system/etc/install-cm-recovery.sh
	rm -rf $(ZIP_DIR)/system/etc/license
	rm -rf $(ZIP_DIR)/system/etc/CHANGELOG-CM.txt
	rm -rf $(ZIP_DIR)/system/etc/recovery-resource.dat
	rm -rf $(ZIP_DIR)/system/fonts/MTLmr3m.ttf
	rm -rf $(ZIP_DIR)/system/media/video
	rm -rf $(ZIP_DIR)/system/recovery-from-boot.p
	rm -rf $(ZIP_DIR)/system/tts
	rm -rf $(ZIP_DIR)/system/usr/srec
	rm -rf $(ZIP_DIR)/system/xbin/htop
	rm -rf $(ZIP_DIR)/system/xbin/lsof
	rm -rf $(ZIP_DIR)/system/xbin/powertop
	rm -rf $(ZIP_DIR)/system/xbin/rsync
	
	@echo Copy GAPPS files
	cp other/GAPPS/addon.d/* $(ZIP_DIR)/system/addon.d/
	cp other/GAPPS/app/* $(ZIP_DIR)/system/app/
	cp -rf other/GAPPS/etc/* $(ZIP_DIR)/system/etc/
	cp other/GAPPS/framework/* $(ZIP_DIR)/system/framework/
	cp other/GAPPS/lib/* $(ZIP_DIR)/system/lib/
	cp other/GAPPS/priv-app/* $(ZIP_DIR)/system/priv-app/
