WLAN_CHIPSET := qca_cld3

#WPA
WPA := wpa_cli

PRODUCT_PACKAGES += $(WLAN_CHIPSET)_wlan.ko
PRODUCT_PACKAGES += wifilearner
PRODUCT_PACKAGES += $(WPA)
PRODUCT_PACKAGES += lowirpcd
PRODUCT_PACKAGES += qsh_wifi_test

#Enable WIFI AWARE FEATURE
WIFI_HIDL_FEATURE_AWARE := true

PRODUCT_COPY_FILES += \
    device/qcom/wlan/lahaina/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
				device/qcom/wlan/lahaina/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
				device/qcom/wlan/lahaina/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
				device/qcom/wlan/lahaina/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
				device/qcom/wlan/lahaina/vendor_cmd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_cmd.xml \
                                frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
                                frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
                                frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

# Enable STA + SAP Concurrency.
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Enable SAP + SAP Feature.
QC_WIFI_HIDL_FEATURE_DUAL_AP := true

# Enable vendor properties.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.aware.interface=wifi-aware0

# Enable STA + STA Feature.
QC_WIFI_HIDL_FEATURE_DUAL_STA := true

#Disable DMS MAC address feature in cnss-daemon
TARGET_USES_NO_DMS_QMI_CLIENT := true
