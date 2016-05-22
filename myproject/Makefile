export PATH := $(shell pwd)/cross-compiler-sh2eb/bin:$(PATH)
all: vmlinux

vmlinux: myapp ./src/init.sh
	mkdir -p ./kernel/myapp/
	cp ./src/myapp ./kernel/myapp/myapp
	cp ./src/init.sh ./kernel/myapp/init.sh
	$(MAKE) -C ./kernel/ all
	cp ./kernel/vmlinux vmlinux

myapp:
	$(MAKE) -C ./src/ myapp

clean:
	$(MAKE) -C ./src clean
	$(MAKE) -C ./kernel/ clean
	rm -f kernel/myapp/*
	rm -f vmlinux

cleanup: clean
	rm -f downloads/*.tar.gz*
	rm -f downloads/*.patch
	rm -rf ./cross-compiler-sh2eb/
	rm -rf ./kernel/linux-4.3/
	rm -r ./kernel/root-filesystem-sh2eb.tar.gz

prepare:
	cd downloads && wget -i download.list
	tar zxvf downloads/cross-compiler-sh2eb.tar.gz
	cd kernel && tar zxvf ../downloads/linux-4.3.tar.gz
	cd kernel/linux-4.3 && \
	patch -N -p1 < ../../downloads/linux-jcore.patch && \
	patch -N -p1 < ../../downloads/linux-fixsh4.patch && \
	patch -N -p1 < ../../downloads/linux-deeplystupid.patch && \
	patch -N -p1 < ../../downloads/linux-fixuClibc.patch
	cp downloads/root-filesystem-sh2eb.tar.gz kernel/
