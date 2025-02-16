#!/bin/bash

ARCH=arm64

make -C /repo

/repo/manual-linux.sh

cp /tmp/aeld/linux-stable/arch/${ARCH}/boot/Image /repo/buildroot/output/images





