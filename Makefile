CONFIG_DIR=$(pwd)/base_external/package/aesd-assignments/
export CONFIG_DIR
BR2_EXTERNAL=../base_external/package/aesd-assignments/
export BR2_EXTERNAL
all: 
	$(MAKE) -C buildroot clean
	$(MAKE) -C buildroot distclean
	$(MAKE) -C buildroot qemu_aarch64_virt_defconfig
	$(MAKE) -C buildroot menuconfig
