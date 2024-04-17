#!/bin/bash

LGR='\033[1;32m'

    echo "Copying files to dir"
    cp out/arch/arm64/boot/Image-dtb AnyKernel3 &&
    cp out/arch/arm64/boot/dtbo.img AnyKernel3 &&
    cp out/arch/arm64/boot/dts/qcom/sm8150-v2.dtb AnyKernel3/dtb.img &&
    cd AnyKernel3 &&
    zip -r franxx_vayu-kernel$(date +"%d%m%Y-%H%M").zip * &&
    mv *.zip /home/hirero
