#!/usr/bin/env bash

FDEVICE="PQ84P01"

fox_get_target_device() {
    local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"

    # Device Identity & Assert Check
    export TARGET_DEVICE_ALT="PQ84P01,NP05J"
    export FOX_TARGET_DEVICES="PQ84P01,NP05J"

    # Snapdragon 8 Elite A/B & Dynamic Partition Flags
    export FOX_AB_DEVICE=1
    export FOX_VIRTUAL_AB_DEVICE=1
    export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
    export FOX_USE_FSCK_EROFS_BINARY=1
    export FOX_USE_DMSETUP=1
    export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
    export OF_FBE_METADATA_MOUNT_IGNORE=1

    # Display Settings (16:10 Aspect Ratio)
    export OF_SCREEN_H=1920
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_ALLOW_DISABLE_NAVBAR=0

    # OrangeFox Binaries & Root Support
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_PATCHELF_BINARY=1
    export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK=1
    export FOX_ENABLE_KERNELSU_SUPPORT=1
    export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1

    # Maintainer Info
    export OF_MAINTAINER="Unofficial"
fi
