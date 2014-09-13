#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/GoogleContactsSyncAdapter.apk
etc/permissions/com.google.android.ble.xml
etc/permissions/com.google.android.camera2.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/permissions/features.xml
etc/preferred-apps/google.xml
framework/com.google.android.ble.jar
framework/com.google.android.camera2.jar
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib/libAppDataSearch.so
lib/libconscrypt_gmscore_jni.so
lib/libgames_rtmp_jni.so
lib/libgcastv2_base.so
lib/libgcastv2_support.so
lib/libgmscore.so
lib/libjgcastservice.so
lib/libjni_latinime.so
lib/libocrclient.so
priv-app/GoogleBackupTransport.apk
priv-app/GoogleFeedback.apk
priv-app/GoogleLoginService.apk
priv-app/GoogleOneTimeInitializer.apk
priv-app/GooglePartnerSetup.apk
priv-app/GoogleServicesFramework.apk
priv-app/Phonesky.apk
priv-app/PrebuiltGmsCore.apk
priv-app/SetupWizard.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
   rm -f /system/app/BrowserProviderProxy.apk
   rm -f /system/app/PartnerBookmarksProvider.apk
   rm -f /system/app/Provision.apk
   rm -f /system/app/Vending.apk
   rm -f /system/priv-app/BrowserProviderProxy.apk
   rm -f /system/priv-app/PartnerBookmarksProvider.apk
   rm -f /system/priv-app/Provision.apk
   rm -f /system/priv-app/Vending.apk
  ;;
esac
