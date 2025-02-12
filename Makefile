CONFIG_DIR=$(pwd)/base_external/package/aesd-assignments/
export CONFIG_DIR
BR2_EXTERNAL=/repo/base_external/package/aesd-assignments/
export BR2_EXTERNAL
BR2_DEFCONFIG=/repo/base_external/company/virt/qemu_aarch64_virt_defconfig
export BR2_DEFCONFIG
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/repo/base_external/company/virt/linux.config
export BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
all: 
#	$(MAKE) -C buildroot clean
#	$(MAKE) -C buildroot distclean
#	$(MAKE) -C buildroot menuconfig
	$(MAKE) -C buildroot defconfig
	$(MAKE) -C buildroot
#	$(MAKE) -C buildroot qemu_aarch64_virt_defconfig
#	$(MAKE) -C buildroot menuconfig
