$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common TWRP/OrangeFox configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit PQ84P01 device configuration
$(call inherit-product, device/nubia/PQ84P01/device.mk)

PRODUCT_DEVICE := PQ84P01
PRODUCT_NAME := twrp_PQ84P01
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NP05J
PRODUCT_MANUFACTURER := nubia
PRODUCT_GMS_CLIENTID_BASE := android-nubia
