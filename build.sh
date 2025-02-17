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

if [ ! -d "arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu" ]; then
    wget -q https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
    tar -xf arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
    rm arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
fi

PATH=$PATH:arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin/
export PATH
ARCH=arm64
CONFIG_DIR=$(pwd)/base_external/package/aesd-assignments/
export CONFIG_DIR
BR2_EXTERNAL=$(pwd)/base_external/package/aesd-assignments/
export BR2_EXTERNAL
BR2_DEFCONFIG=$(pwd)/base_external/company/virt/qemu_aarch64_virt_defconfig
export BR2_DEFCONFIG
#MYPWD=$(pwd)
#ARCH=arm64
#BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/repo/base_external/company/virt/linux.config
#export BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
CC=aarch64-none-linux-gnu-gcc
export CC
CXX=aarch64-none-linux-gnu-g++
export CXX

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

MYDIR=$(pwd)

#bash manual-linux.sh

# make -C buildroot menuconfig
# make -C buildroot source   # download the files but doesnt seem to be working
make -C buildroot

bash ${MYDIR}/manual-linux.sh

cp /tmp/aeld/linux-stable/arch/${ARCH}/boot/Image ${MYDIR}/buildroot/output/images

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
