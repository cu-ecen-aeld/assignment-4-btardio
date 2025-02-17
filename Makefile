CONFIG_DIR=/repo/base_external/package/aesd-assignments/
export CONFIG_DIR
BR2_EXTERNAL=/repo/base_external/package/aesd-assignments/
export BR2_EXTERNAL
BR2_DEFCONFIG=/repo/base_external/company/virt/qemu_aarch64_virt_defconfig
export BR2_DEFCONFIG
MYPWD=$(pwd)
ARCH=arm64
#BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/repo/base_external/company/virt/linux.config
#export BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
CC=/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc
CXX=/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-g++

CROSS_COMPILE=aarch64-none-linux-gnu-
#BR2_LINUX_KERNEL_DEFCONFIG=/repo/base_external/company/virt/Config.in.aarch64
#export BR2_LINUX_KERNEL_DEFCONFIG

all :
#	$(MAKE) -C buildroot menuconfig
	$(MAKE) -C buildroot source
	$(MAKE) -C buildroot
#: copy_config_linux makebuildroot makekernel copykernel
#    $( shell cp /repo/base_external/company/virt/linux.config /repo/buildroot/.config )
#	$(MAKE) -C buildroot clean
#	$(MAKE) -C buildroot distclean
#	$(MAKE) -C buildroot menuconfig
#	$(MAKE) -C buildroot defconfig
#	$(MAKE) -C buildroot defconfig # BR2_DEFCONFIG=/repo/base_external/company/virt/qemu_aarch64_virt_defconfig defconfig
#
#	$(MAKE) -C /repo/buildroot/output/build/linux-6.1.44 all
#

#	cd buildroot/output/build/linux-*
#	make menuconfig ARCH=arm
#	make ARCH=arm


#    $(MAKE) -C buildroot linux-menuconfig BR2_LINUX_KERNEL_DEFCONFIG=/repo/base_external/company/virt/Config.in.aarch64
#	$(MAKE) -C buildroot menuconfig
#	$(MAKE) -C buildroot source
#	$(MAKE) -C buildroot
	#cd buildroot/output/build/linux-* $(MAKE) menuconfig ARCH=arm
	
	#@echo -n "Are you sure? [y/N] " && read ans && if [ $${ans:-'N'} = 'y' ]; then $(MAKE) mymake; fi
	#
	


	#
	#$(MAKE) -C buildroot

#	$(MAKE) -C buildroot qemu_aarch64_virt_defconfig
#	$(MAKE) -C buildroot menuconfig
#
#
#



makebuildroot :
	$(MAKE) -C buildroot menuconfig
	$(MAKE) -C buildroot source
	$(MAKE) -C buildroot

#copykernel :
#	$( shell cp /tmp/aeld/linux-stable/arch/${ARCH}/boot/Image /repo/buildroot/output/images )
#.config )
# copy to buildroot/output/images
#makekernel :
#	$( shell /repo/buildroot/manual-linux.sh )

	


mymake:
	#$(MAKE) -C buildroot ARCH=arm
	$( shell echo "oooOOOooo" )

copy_config_linux:
	$( shell cp /repo/base_external/company/virt/linux.config /repo/buildroot/.config )
	$( shell cp /arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc /repo/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-gcc )

#:
