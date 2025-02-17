#!/bin/bash
#Script to build buildroot configuration
#Author: Siddhant Jajoo

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule init
git submodule sync
git submodule update

if [ $# -lt 1 ]
then
        echo "Using default directory ${EXTERNAL_REL_BUILDROOT} for BR2_EXTERNAL"
    else
        EXTERNAL_REL_BUILDROOT=$1
        echo "Using passed directory ${EXTERNAL_REL_BUILDROOT} for BR2_EXTERNAL"
fi


mkdir -p buildroot
cp buildroot_working_menuconfig.config buildroot/.config

ARCH=arm64
# make -C buildroot menuconfig
make -C buildroot source   # download the files but doesnt seem to be working
make -C buildroot

bash manual-linux.sh

cp /tmp/aeld/linux-stable/arch/${ARCH}/boot/Image buildroot/output/images

#bash complete-assignment.sh


set -e 
cd `dirname $0`

mkdir -p buildroot


if [ ! -e buildroot/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"

	if [ -e ${AESD_MODIFIED_DEFCONFIG} ]
	then
		echo "USING ${AESD_MODIFIED_DEFCONFIG}"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}
	else
		echo "Run ./save_config.sh to save this as the default configuration in ${AESD_MODIFIED_DEFCONFIG}"
		echo "Then add packages as needed to complete the installation, re-running ./save_config.sh as needed"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_DEFAULT_DEFCONFIG}
	fi
else
	echo "USING EXISTING BUILDROOT CONFIG"
	echo "To force update, delete .config or make changes using make menuconfig and build again."
	make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

fi
