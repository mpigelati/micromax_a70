#!/bin/sh
DEVICE=a70
if [ "$1" = "adb" ]
then
echo "Using ADB pull to extract files."
cmd="adb"

elif [ "$1" = "cp" ]
then

if [ $# -lt 2 ]
then
echo "Cannot use copy operation without a path! Path should lead to the base directory of a ROM. ex. /home/user/somerom/"
exit
else
echo "Using copy operation to extract files."
cmd="cp"
fi

else
echo "Invalid syntax. Script must be called with the following parameters..."
echo "./extract-files.sh adb : This will pull files from your device using ADB."
echo "./extract-files.sh cp /path/to/ROM : This will copy files from a directory."
exit

fi
rm -rf ../../../vendor/micromax/$DEVICE/proprietary
mkdir -p ../../../vendor/micromax/$DEVICE/proprietary
DIRS="
etc
etc/bluetooth
etc/dhcpcd
etc/firmware
etc/firmware/wlan
etc/permissions
etc/wifi
lib/egl
lib/hw
lib/modules
bin
"

for DIR in $DIRS; do
mkdir -p ../../../vendor/micromax/$DEVICE/proprietary/$DIR
done

FILES="
etc/01_qcomm_omx.cfg
etc/apns-conf.xml
etc/gps.conf
etc/init.qcom.bt.sh
etc/init.qcom.coex.sh
etc/init.qcom.fm.sh
etc/init.qcom.post_boot.sh
etc/init.qcom.sdio.sh
etc/init.qcom.wifi.sh
etc/loc_parameter.ini
etc/vold.fstab

etc/bluetooth/audio.conf
etc/bluetooth/auto_pairing.conf
etc/bluetooth/blacklist.conf
etc/bluetooth/input.conf
etc/bluetooth/main.conf

etc/dhcpcd/dhcpcd.conf
etc/dhcpcd/dhcpcd-run-hooks
etc/dhcpcd/dhcpcd-hooks/01-test
etc/dhcpcd/dhcpcd-hooks/20-dns.conf
etc/dhcpcd/dhcpcd-hooks/95-configured

etc/firmware/ts_fw.i
etc/firmware/yamato_pfp.fw
etc/firmware/yamato_pm4.fw
etc/firmware/wlan/cfg.dat
etc/firmware/wlan/qcom_cfg.ini
etc/firmware/wlan/qcom_fw.bin
etc/firmware/wlan/qcom_nv.bin
etc/firmware/wlan/qcom_wlan_nv.bin

etc/permissions/android.hardware.bluetooth.xml
etc/permissions/android.hardware.camera.autofocus.xml
etc/permissions/android.hardware.camera.flash-autofocus.xml
etc/permissions/android.hardware.camera.xml
etc/permissions/android.hardware.location.gps.xml
etc/permissions/android.hardware.location.xml
etc/permissions/android.hardware.sensor.light.xml
etc/permissions/android.hardware.sensor.proximity.xml
etc/permissions/android.hardware.telephony.cdma.xml
etc/permissions/android.hardware.telephony.gsm.xml
etc/permissions/android.hardware.touchscreen.multitouch.xml
etc/permissions/android.hardware.touchscreen.xml
etc/permissions/android.hardware.wifi.xml
etc/permissions/android.software.live_wallpaper.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.qualcomm.location.vzw_library.xml
etc/permissions/handheld_core_hardware.xml
etc/permissions/platform.xml
etc/permissions/qcnvitems.xml
etc/permissions/qcrilhook.xml

etc/wifi/wpa_supplicant.conf

wifi/BCM4329B1_002.002.023.0735.BYD.38.4MHz.CL1.TESTONLY.hcd
wifi/dhd.ko
wifi/nvram_mfgtest.txt
wifi/nvram.txt
wifi/patch_plus
wifi/rtecdc-mfgtest.bin
wifi/sdio-g-cdc-full11n-reclaim-roml-wme-aoe-pktfilter-wapi.bin
wifi/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin
wifi/wlarm_android
wifi/wpa_supplicant.conf

lib/liba2dp.so
lib/libacc.so
lib/libandroid_runtime.so
lib/libandroid_servers.so
lib/libantivirus.so
lib/libaudioalsa.so
lib/libaudioeq.so
lib/libaudioflinger.so
lib/libaudiopolicy.so
lib/libaudio.so
lib/libauth.so
lib/libbinder.so
lib/libbluedroid.so
lib/libbluetoothd.so
lib/libbluetooth.so
lib/libcamera_client.so
lib/libcameraservice.so
lib/libcamera.so
lib/libcm.so
lib/libcommondefs.so
lib/libcrypto.so
lib/libc.so
lib/libctest.so
lib/libcutils.so
lib/libdbus.so
lib/libdiag.so
lib/libdiskconfig.so
lib/libdll.so
lib/libdl.so
lib/libdrm1_jni.so
lib/libdrm1.so
lib/libdsm.so
lib/libdsprofile.so
lib/libdss.so
lib/libdsutils.so
lib/libdvm.so
lib/libEGL.so
lib/libemoji.so
lib/libETC1.so
lib/libexif.so
lib/libexpat.so
lib/libfactorytest.so
lib/libFFTEm.so
lib/libftcamera.so
lib/libftgps.so
lib/libGLESv1_CM.so
lib/libGLESv2.so
lib/libgps.so
lib/libgsdi_exp.so
lib/libgsl.so
lib/libgstk_exp.so
lib/libhardware_legacy.so
lib/libhardware.so
lib/libicudata.so
lib/libicui18n.so
lib/libicuuc.so
lib/libiprouteutil.so
lib/libjnigraphics.so
lib/libjni_latinime.so
lib/libjni_pinyinime.so
lib/libjpeg.so
lib/libloc_api.so
lib/libloc_ext.so
lib/libloc-rpc.so
lib/libloc.so
lib/liblog.so
lib/libmedia_jni.so
lib/libmediaplayerservice.so
lib/libmedia.so
lib/libmm-abl.so
lib/libmm-adspsvc.so
lib/libmmgsdilib.so
lib/libmmipl.so
lib/libmmjpeg.so
lib/libmm-omxcore.so
lib/libm.so
lib/libMSPdf.294.so
lib/libmvs.so
lib/libnativehelper.so
lib/libnetlink.so
lib/libnetmgr.so
lib/libnetutils.so
lib/libnv.so
lib/liboemcamera.so
lib/liboem_rapi.so
lib/libom.so
lib/libomx_aacdec_sharedlibrary.so
lib/libOmxAacDec.so
lib/libOmxAacEnc.so
lib/libOmxAdpcmDec.so
lib/libomx_amrdec_sharedlibrary.so
lib/libOmxAmrDec.so
lib/libomx_amrenc_sharedlibrary.so
lib/libOmxAmrEnc.so
lib/libOmxAmrRtpDec.so
lib/libOmxAmrwbDec.so
lib/libomx_avcdec_sharedlibrary.so
lib/libOmxCore.so
lib/libOmxEvrcDec.so
lib/libOmxEvrcEnc.so
lib/libOmxH264Dec.so
lib/libomx_m4vdec_sharedlibrary.so
lib/libomx_mp3dec_sharedlibrary.so
lib/libOmxMp3Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxQcelp13Dec.so
lib/libOmxQcelp13Enc.so
lib/libomx_sharedlibrary.so
lib/libOmxVidEnc.so
lib/libOmxWmaDec.so
lib/libOmxWmvDec.so
lib/liboncrpc.so
lib/libopencore_author.so
lib/libopencore_common.so
lib/libopencore_downloadreg.so
lib/libopencore_download.so
lib/libopencorehw.so
lib/libopencore_mp4localreg.so
lib/libopencore_mp4local.so
lib/libopencore_net_support.so
lib/libopencore_player.so
lib/libopencore_rtspreg.so
lib/libopencore_rtsp.so
lib/libpbmlib.so
lib/libpdapi.so
lib/libpdsm_atl.so
lib/libping_apps.so
lib/libping_mdm.so
lib/libpixelflinger.so
lib/libqcomm_omx.so
lib/libqmi.so
lib/libqueue.so
lib/librefcne.so
lib/libreference-cdma-sms.so
lib/libreference-ril.so
lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libril.so
lib/librpc.so
lib/librs_jni.so
lib/libRS.so
lib/libservicemenu_jni.so
lib/libskiagl.so
lib/libskia.so
lib/libsnd.so
lib/libsonivox.so
lib/libsoundpool.so
lib/libsqlite.so
lib/libSR_AudioIn.so
lib/libsrec_jni.so
lib/libssl.so
lib/libstagefright_amrnb_common.so
lib/libstagefright_avc_common.so
lib/libstagefright_color_conversion.so
lib/libstagefrighthw.so
lib/libstagefright_omx.so
lib/libstagefright.so
lib/libstdc++.so
lib/libstlport.so
lib/libsurfaceflinger_client.so
lib/libsurfaceflinger.so
lib/libsystem_server.so
lib/libsysutils.so
lib/libthread_db.so
lib/libttspico.so
lib/libttssynthproxy.so
lib/libuim.so
lib/libui.so
lib/libutils.so
lib/libvoicesearch.so
lib/libvorbisidec.so
lib/libwapicertjni.so
lib/libwbxml_jni.so
lib/libwebcore.so
lib/libwiperjni.so
lib/libwms.so
lib/libwmsts.so
lib/libwpa_client.so
lib/libxml2wbxml.so
lib/libz.so

bin/akmd2
bin/brcm_patchram_plus
bin/cnd
bin/port-bridge
bin/qmuxd
bin/rild
bin/wpa_supplicant

lib/hw/copybit.msm7k.so
lib/hw/gralloc.default.so
lib/hw/gralloc.msm7k.so
lib/hw/lights.msm7k.so
lib/hw/sensors.default.so

lib/egl/egl.cfg
lib/egl/libEGL_adreno200.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_adreno200.so
lib/egl/libGLESv2_adreno200.so
lib/egl/libq3dtools_adreno200.so

lib/modules/libra.ko
lib/modules/librasdioif.ko
"

for FILE in $FILES; do
if [ "$cmd" = "adb" ]
then
adb pull /system/$FILE ../../../vendor/micromax/$DEVICE/proprietary/$FILE
elif [ "$cmd" = "cp" ]
then
cp $2/system/$FILE ../../../vendor/micromax/$DEVICE/proprietary/$FILE
fi
done

chmod 755 ../../../vendor/micromax/a70/proprietary/bin/*

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/micromax/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \\
vendor/micromax/a70/proprietary/etc/apns-conf.xml:system/etc/apns-conf.xml \\
vendor/micromax/a70/proprietary/etc/gps.conf:system/etc/gps.conf \\
vendor/micromax/a70/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \\
vendor/micromax/a70/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \\
vendor/micromax/a70/proprietary/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \\
vendor/micromax/a70/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \\
vendor/micromax/a70/proprietary/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \\
vendor/micromax/a70/proprietary/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \\
vendor/micromax/a70/proprietary/etc/loc_parameter.ini:system/etc/loc_parameter.ini \\
vendor/micromax/a70/proprietary/etc/vold.fstab :system/etc/vold.fstab 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \\
vendor/micromax/a70/proprietary/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \\
vendor/micromax/a70/proprietary/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \\
vendor/micromax/a70/proprietary/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \\
vendor/micromax/a70/proprietary/etc/bluetooth/main.conf :system/etc/bluetooth/main.conf 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \\
vendor/micromax/a70/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \\
vendor/micromax/a70/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \\
vendor/micromax/a70/proprietary/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \\
vendor/micromax/a70/proprietary/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/firmware/ts_fw.i:system/etc/firmware/ts_fw.i \\
vendor/micromax/a70/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
vendor/micromax/a70/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \\
vendor/micromax/a70/proprietary/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \\
vendor/micromax/a70/proprietary/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \\
vendor/micromax/a70/proprietary/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \\
vendor/micromax/a70/proprietary/etc/firmware/wlan/qcom_nv.bin:system/etc/firmware/wlan/qcom_nv.bin \\
vendor/micromax/a70/proprietary/etc/firmware/wlan/qcom_wlan_nv.bin :system/etc/firmware/wlan/qcom_wlan_nv.bin 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \\
vendor/micromax/a70/proprietary/etc/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \\
vendor/micromax/a70/proprietary/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \\
vendor/micromax/a70/proprietary/etc/permissions/com.qualcomm.location.vzw_library.xml:system/etc/permissions/com.qualcomm.location.vzw_library.xml \\
vendor/micromax/a70/proprietary/etc/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \\
vendor/micromax/a70/proprietary/etc/permissions/platform.xml:system/etc/permissions/platform.xml \\
vendor/micromax/a70/proprietary/etc/permissions/qcnvitems.xml:system/etc/permissions/qcnvitems.xml \\
vendor/micromax/a70/proprietary/etc/permissions/qcrilhook.xml :system/etc/permissions/qcrilhook.xml 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/wifi/BCM4329B1_002.002.023.0735.BYD.38.4MHz.CL1.TESTONLY.hcd:system/wifi/BCM4329B1_002.002.023.0735.BYD.38.4MHz.CL1.TESTONLY.hcd \\
vendor/micromax/a70/proprietary/wifi/dhd.ko:system/wifi/dhd.ko \\
vendor/micromax/a70/proprietary/wifi/nvram_mfgtest.txt:system/wifi/nvram_mfgtest.txt \\
vendor/micromax/a70/proprietary/wifi/nvram.txt:system/wifi/nvram.txt \\
vendor/micromax/a70/proprietary/wifi/patch_plus:system/wifi/patch_plus \\
vendor/micromax/a70/proprietary/wifi/rtecdc-mfgtest.bin:system/wifi/rtecdc-mfgtest.bin \\
vendor/micromax/a70/proprietary/wifi/sdio-g-cdc-full11n-reclaim-roml-wme-aoe-pktfilter-wapi.bin:system/wifi/sdio-g-cdc-full11n-reclaim-roml-wme-aoe-pktfilter-wapi.bin \\
vendor/micromax/a70/proprietary/wifi/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin:system/wifi/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin \\
vendor/micromax/a70/proprietary/wifi/wlarm_android:system/wifi/wlarm_android \\
vendor/micromax/a70/proprietary/wifi/wpa_supplicant.conf :system/wifi/wpa_supplicant.conf 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \\
vendor/micromax/a70/proprietary/lib/libacc.so:system/lib/libacc.so \\
vendor/micromax/a70/proprietary/lib/libandroid_runtime.so:system/lib/libandroid_runtime.so \\
vendor/micromax/a70/proprietary/lib/libandroid_servers.so:system/lib/libandroid_servers.so \\
vendor/micromax/a70/proprietary/lib/libantivirus.so:system/lib/libantivirus.so \\
vendor/micromax/a70/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so \\
vendor/micromax/a70/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \\
vendor/micromax/a70/proprietary/lib/libaudioflinger.so:system/lib/libaudioflinger.so \\
vendor/micromax/a70/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \\
vendor/micromax/a70/proprietary/lib/libaudio.so:system/lib/libaudio.so \\
vendor/micromax/a70/proprietary/lib/libauth.so:system/lib/libauth.so \\
vendor/micromax/a70/proprietary/lib/libbinder.so:system/lib/libbinder.so \\
vendor/micromax/a70/proprietary/lib/libbluedroid.so:system/lib/libbluedroid.so \\
vendor/micromax/a70/proprietary/lib/libbluetoothd.so:system/lib/libbluetoothd.so \\
vendor/micromax/a70/proprietary/lib/libbluetooth.so:system/lib/libbluetooth.so \\
vendor/micromax/a70/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \\
vendor/micromax/a70/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \\
vendor/micromax/a70/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
vendor/micromax/a70/proprietary/lib/libcm.so:system/lib/libcm.so \\
vendor/micromax/a70/proprietary/lib/libcommondefs.so:system/lib/libcommondefs.so \\
vendor/micromax/a70/proprietary/lib/libcrypto.so:system/lib/libcrypto.so \\
vendor/micromax/a70/proprietary/lib/libc.so:system/lib/libc.so \\
vendor/micromax/a70/proprietary/lib/libctest.so:system/lib/libctest.so \\
vendor/micromax/a70/proprietary/lib/libcutils.so:system/lib/libcutils.so \\
vendor/micromax/a70/proprietary/lib/libdbus.so:system/lib/libdbus.so \\
vendor/micromax/a70/proprietary/lib/libdiag.so:system/lib/libdiag.so \\
vendor/micromax/a70/proprietary/lib/libdiskconfig.so:system/lib/libdiskconfig.so \\
vendor/micromax/a70/proprietary/lib/libdll.so:system/lib/libdll.so \\
vendor/micromax/a70/proprietary/lib/libdl.so:system/lib/libdl.so \\
vendor/micromax/a70/proprietary/lib/libdrm1_jni.so:system/lib/libdrm1_jni.so \\
vendor/micromax/a70/proprietary/lib/libdrm1.so:system/lib/libdrm1.so \\
vendor/micromax/a70/proprietary/lib/libdsm.so:system/lib/libdsm.so \\
vendor/micromax/a70/proprietary/lib/libdsprofile.so:system/lib/libdsprofile.so \\
vendor/micromax/a70/proprietary/lib/libdss.so:system/lib/libdss.so \\
vendor/micromax/a70/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \\
vendor/micromax/a70/proprietary/lib/libdvm.so:system/lib/libdvm.so \\
vendor/micromax/a70/proprietary/lib/libEGL.so:system/lib/libEGL.so \\
vendor/micromax/a70/proprietary/lib/libemoji.so:system/lib/libemoji.so \\
vendor/micromax/a70/proprietary/lib/libETC1.so:system/lib/libETC1.so \\
vendor/micromax/a70/proprietary/lib/libexif.so:system/lib/libexif.so \\
vendor/micromax/a70/proprietary/lib/libexpat.so:system/lib/libexpat.so \\
vendor/micromax/a70/proprietary/lib/libfactorytest.so:system/lib/libfactorytest.so \\
vendor/micromax/a70/proprietary/lib/libFFTEm.so:system/lib/libFFTEm.so \\
vendor/micromax/a70/proprietary/lib/libftcamera.so:system/lib/libftcamera.so \\
vendor/micromax/a70/proprietary/lib/libftgps.so:system/lib/libftgps.so \\
vendor/micromax/a70/proprietary/lib/libGLESv1_CM.so:system/lib/libGLESv1_CM.so \\
vendor/micromax/a70/proprietary/lib/libGLESv2.so:system/lib/libGLESv2.so \\
vendor/micromax/a70/proprietary/lib/libgps.so:system/lib/libgps.so \\
vendor/micromax/a70/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \\
vendor/micromax/a70/proprietary/lib/libgsl.so:system/lib/libgsl.so \\
vendor/micromax/a70/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \\
vendor/micromax/a70/proprietary/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so \\
vendor/micromax/a70/proprietary/lib/libhardware.so:system/lib/libhardware.so \\
vendor/micromax/a70/proprietary/lib/libicudata.so:system/lib/libicudata.so \\
vendor/micromax/a70/proprietary/lib/libicui18n.so:system/lib/libicui18n.so \\
vendor/micromax/a70/proprietary/lib/libicuuc.so:system/lib/libicuuc.so \\
vendor/micromax/a70/proprietary/lib/libiprouteutil.so:system/lib/libiprouteutil.so \\
vendor/micromax/a70/proprietary/lib/libjnigraphics.so:system/lib/libjnigraphics.so \\
vendor/micromax/a70/proprietary/lib/libjni_latinime.so:system/lib/libjni_latinime.so \\
vendor/micromax/a70/proprietary/lib/libjni_pinyinime.so:system/lib/libjni_pinyinime.so \\
vendor/micromax/a70/proprietary/lib/libjpeg.so:system/lib/libjpeg.so \\
vendor/micromax/a70/proprietary/lib/libloc_api.so:system/lib/libloc_api.so \\
vendor/micromax/a70/proprietary/lib/libloc_ext.so:system/lib/libloc_ext.so \\
vendor/micromax/a70/proprietary/lib/libloc-rpc.so:system/lib/libloc-rpc.so \\
vendor/micromax/a70/proprietary/lib/libloc.so:system/lib/libloc.so \\
vendor/micromax/a70/proprietary/lib/liblog.so:system/lib/liblog.so \\
vendor/micromax/a70/proprietary/lib/libmedia_jni.so:system/lib/libmedia_jni.so \\
vendor/micromax/a70/proprietary/lib/libmediaplayerservice.so:system/lib/libmediaplayerservice.so \\
vendor/micromax/a70/proprietary/lib/libmedia.so:system/lib/libmedia.so \\
vendor/micromax/a70/proprietary/lib/libmm-abl.so:system/lib/libmm-abl.so \\
vendor/micromax/a70/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
vendor/micromax/a70/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \\
vendor/micromax/a70/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \\
vendor/micromax/a70/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \\
vendor/micromax/a70/proprietary/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \\
vendor/micromax/a70/proprietary/lib/libm.so:system/lib/libm.so \\
vendor/micromax/a70/proprietary/lib/libMSPdf.294.so:system/lib/libMSPdf.294.so \\
vendor/micromax/a70/proprietary/lib/libmvs.so:system/lib/libmvs.so \\
vendor/micromax/a70/proprietary/lib/libnativehelper.so:system/lib/libnativehelper.so \\
vendor/micromax/a70/proprietary/lib/libnetlink.so:system/lib/libnetlink.so \\
vendor/micromax/a70/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so \\
vendor/micromax/a70/proprietary/lib/libnetutils.so:system/lib/libnetutils.so \\
vendor/micromax/a70/proprietary/lib/libnv.so:system/lib/libnv.so \\
vendor/micromax/a70/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \\
vendor/micromax/a70/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \\
vendor/micromax/a70/proprietary/lib/libom.so:system/lib/libom.so \\
vendor/micromax/a70/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \\
vendor/micromax/a70/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \\
vendor/micromax/a70/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \\
vendor/micromax/a70/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \\
vendor/micromax/a70/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \\
vendor/micromax/a70/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \\
vendor/micromax/a70/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \\
vendor/micromax/a70/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxCore.so:system/lib/libOmxCore.so \\
vendor/micromax/a70/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \\
vendor/micromax/a70/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \\
vendor/micromax/a70/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
vendor/micromax/a70/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \\
vendor/micromax/a70/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
vendor/micromax/a70/proprietary/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \\
vendor/micromax/a70/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \\
vendor/micromax/a70/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \\
vendor/micromax/a70/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
vendor/micromax/a70/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \\
vendor/micromax/a70/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \\
vendor/micromax/a70/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \\
vendor/micromax/a70/proprietary/lib/libopencore_author.so:system/lib/libopencore_author.so \\
vendor/micromax/a70/proprietary/lib/libopencore_common.so:system/lib/libopencore_common.so \\
vendor/micromax/a70/proprietary/lib/libopencore_downloadreg.so:system/lib/libopencore_downloadreg.so \\
vendor/micromax/a70/proprietary/lib/libopencore_download.so:system/lib/libopencore_download.so \\
vendor/micromax/a70/proprietary/lib/libopencorehw.so:system/lib/libopencorehw.so \\
vendor/micromax/a70/proprietary/lib/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \\
vendor/micromax/a70/proprietary/lib/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \\
vendor/micromax/a70/proprietary/lib/libopencore_net_support.so:system/lib/libopencore_net_support.so \\
vendor/micromax/a70/proprietary/lib/libopencore_player.so:system/lib/libopencore_player.so \\
vendor/micromax/a70/proprietary/lib/libopencore_rtspreg.so:system/lib/libopencore_rtspreg.so \\
vendor/micromax/a70/proprietary/lib/libopencore_rtsp.so:system/lib/libopencore_rtsp.so \\
vendor/micromax/a70/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \\
vendor/micromax/a70/proprietary/lib/libpdapi.so:system/lib/libpdapi.so \\
vendor/micromax/a70/proprietary/lib/libpdsm_atl.so:system/lib/libpdsm_atl.so \\
vendor/micromax/a70/proprietary/lib/libping_apps.so:system/lib/libping_apps.so \\
vendor/micromax/a70/proprietary/lib/libping_mdm.so:system/lib/libping_mdm.so \\
vendor/micromax/a70/proprietary/lib/libpixelflinger.so:system/lib/libpixelflinger.so \\
vendor/micromax/a70/proprietary/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \\
vendor/micromax/a70/proprietary/lib/libqmi.so:system/lib/libqmi.so \\
vendor/micromax/a70/proprietary/lib/libqueue.so:system/lib/libqueue.so \\
vendor/micromax/a70/proprietary/lib/librefcne.so:system/lib/librefcne.so \\
vendor/micromax/a70/proprietary/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so \\
vendor/micromax/a70/proprietary/lib/libreference-ril.so:system/lib/libreference-/ril.so \\
vendor/micromax/a70/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \\
vendor/micromax/a70/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \\
vendor/micromax/a70/proprietary/lib/libril.so:system/lib/libril.so \\
vendor/micromax/a70/proprietary/lib/librpc.so:system/lib/librpc.so \\
vendor/micromax/a70/proprietary/lib/librs_jni.so:system/lib/librs_jni.so \\
vendor/micromax/a70/proprietary/lib/libRS.so:system/lib/libRS.so \\
vendor/micromax/a70/proprietary/lib/libservicemenu_jni.so:system/lib/libservicemenu_jni.so \\
vendor/micromax/a70/proprietary/lib/libskiagl.so:system/lib/libskiagl.so \\
vendor/micromax/a70/proprietary/lib/libskia.so:system/lib/libskia.so \\
vendor/micromax/a70/proprietary/lib/libsnd.so:system/lib/libsnd.so \\
vendor/micromax/a70/proprietary/lib/libsonivox.so:system/lib/libsonivox.so \\
vendor/micromax/a70/proprietary/lib/libsoundpool.so:system/lib/libsoundpool.so \\
vendor/micromax/a70/proprietary/lib/libsqlite.so:system/lib/libsqlite.so \\
vendor/micromax/a70/proprietary/lib/libSR_AudioIn.so:system/lib/libSR_AudioIn.so \\
vendor/micromax/a70/proprietary/lib/libsrec_jni.so:system/lib/libsrec_jni.so \\
vendor/micromax/a70/proprietary/lib/libssl.so:system/lib/libssl.so \\
vendor/micromax/a70/proprietary/lib/libstagefright_amrnb_common.so:system/lib/libstagefright_amrnb_common.so \\
vendor/micromax/a70/proprietary/lib/libstagefright_avc_common.so:system/lib/libstagefright_avc_common.so \\
vendor/micromax/a70/proprietary/lib/libstagefright_color_conversion.so:system/lib/libstagefright_color_conversion.so \\
vendor/micromax/a70/proprietary/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \\
vendor/micromax/a70/proprietary/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \\
vendor/micromax/a70/proprietary/lib/libstagefright.so:system/lib/libstagefright.so \\
vendor/micromax/a70/proprietary/lib/libstdc++.so:system/lib/libstdc++.so \\
vendor/micromax/a70/proprietary/lib/libstlport.so:system/lib/libstlport.so \\
vendor/micromax/a70/proprietary/lib/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so \\
vendor/micromax/a70/proprietary/lib/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \\
vendor/micromax/a70/proprietary/lib/libsystem_server.so:system/lib/libsystem_server.so \\
vendor/micromax/a70/proprietary/lib/libsysutils.so:system/lib/libsysutils.so \\
vendor/micromax/a70/proprietary/lib/libthread_db.so:system/lib/libthread_db.so \\
vendor/micromax/a70/proprietary/lib/libttspico.so:system/lib/libttspico.so \\
vendor/micromax/a70/proprietary/lib/libttssynthproxy.so:system/lib/libttssynthproxy.so \\
vendor/micromax/a70/proprietary/lib/libuim.so:system/lib/libuim.so \\
vendor/micromax/a70/proprietary/lib/libui.so:system/lib/libui.so \\
vendor/micromax/a70/proprietary/lib/libutils.so:system/lib/libutils.so \\
vendor/micromax/a70/proprietary/lib/libvoicesearch.so:system/lib/libvoicesearch.so \\
vendor/micromax/a70/proprietary/lib/libvorbisidec.so:system/lib/libvorbisidec.so \\
vendor/micromax/a70/proprietary/lib/libwapicertjni.so:system/lib/libwapicertjni.so \\
vendor/micromax/a70/proprietary/lib/libwbxml_jni.so:system/lib/libwbxml_jni.so \\
vendor/micromax/a70/proprietary/lib/libwebcore.so:system/lib/libwebcore.so \\
vendor/micromax/a70/proprietary/lib/libwiperjni.so:system/lib/libwiperjni.so \\
vendor/micromax/a70/proprietary/lib/libwms.so:system/lib/libwms.so \\
vendor/micromax/a70/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \\
vendor/micromax/a70/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so \\
vendor/micromax/a70/proprietary/lib/libxml2wbxml.so:system/lib/libxml2wbxml.so \\
vendor/micromax/a70/proprietary/lib/libz.so :system/lib/libz.so 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/bin/akmd2:system/bin/akmd2 \\
vendor/micromax/a70/proprietary/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \\
vendor/micromax/a70/proprietary/bin/cnd:system/bin/cnd \\
vendor/micromax/a70/proprietary/bin/port-bridge:system/bin/port-bridge \\
vendor/micromax/a70/proprietary/bin/qmuxd:system/bin/qmuxd \\
vendor/micromax/a70/proprietary/bin/rild:system/bin/rild \\
vendor/micromax/a70/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/lib/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \\
vendor/micromax/a70/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \\
vendor/micromax/a70/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \\
vendor/micromax/a70/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \\
vendor/micromax/a70/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \\
vendor/micromax/a70/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
vendor/micromax/a70/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
vendor/micromax/a70/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
vendor/micromax/a70/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
vendor/micromax/a70/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so 

PRODUCT_COPY_FILES += \\
vendor/micromax/a70/proprietary/lib/modules/libra.ko:system/lib/modules/libra.ko \\
vendor/micromax/a70/proprietary/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko 

EOF

./setup-makefiles.sh
