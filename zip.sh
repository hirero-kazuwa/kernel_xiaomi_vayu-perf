#!/bin/bash

LGR='\033[1;32m'

anykernel="AnyKernel3"

    echo "Copying files to $anykernel dir"
    cp out/arch/arm64/boot/Image out/AnyKernel3 && cp out/arch/arm64/boot/dtbo.img out/AnyKernel3
    cd out/AnyKernel3
    zip -r custom_vayu-perf$(date +"%d%m%Y-%H%M").zip *
    mv *.zip /home/hirero
