all: vmlinux

vmlinux: initramfs_data.cpio.gz mini.config
	$(MAKE) -C ./linux-4.3/ allnoconfig ARCH=sh KCONFIG_ALLCONFIG=../mini.config
	$(MAKE) -C ./linux-4.3/ ARCH=sh CROSS_COMPILE=sh2eb- && \
	cp ./linux-4.3/vmlinux vmlinux

initramfs_data.cpio.gz: ./myapp/myapp ./myapp/init.sh root-filesystem-sh2eb.tar.gz additional_cpio_list
	tar zxvf root-filesystem-sh2eb.tar.gz
	cp ./myapp/myapp root-filesystem-sh2eb/bin/
	cp ./myapp/init.sh root-filesystem-sh2eb/sbin/
	./linux-4.3/scripts/gen_initramfs_list.sh -u squash -g squash ./root-filesystem-sh2eb/ > root_filesystem_cpio_list
	cat root_filesystem_cpio_list additional_cpio_list > initramfs_data_cpio_list
	$(MAKE) -C ./linux-4.3/usr/ gen_init_cpio
	./linux-4.3/usr/gen_init_cpio initramfs_data_cpio_list | gzip > initramfs_data.cpio.gz

clean_kernel:
	$(MAKE) -C ./linux-4.3/ clean

clean:
	rm -rf root-filesystem-sh2eb/
	rm -f initramfs_data.cpio.gz
	rm -f initramfs_data_cpio_list
	rm -f root_filesystem_cpio_list
	rm -f vmlinux
