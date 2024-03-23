#!/bin/bash

echo "Cleaning old stuff"

LGR='\033[1;32m'

make clean
make mrproper
rm -r out
echo -e ${LGR} "#### clean has been completed successfully  ####"

kernel_dir="${PWD}"
CCACHE=$(command -v ccache)
objdir="${kernel_dir}/out"
builddir="${kernel_dir}/build"
ZIMAGE=$kernel_dir/out/arch/arm64/boot/Image

# Modify the Path according to your location
TC_DIR=/home/hirero/e/clang/p
CLANG_DIR=/home/hirero/e/clang/clang
##

export CONFIG_FILE="vayu_user_defconfig"
export ARCH="arm64"
export KBUILD_BUILD_HOST=ぞうしろかずわ
export KBUILD_BUILD_USER=debian

export PATH="$CLANG_DIR/bin:$PATH"

    START=$(date +"%s")
    echo -e ${LGR} "########### Generating Defconfig ############${NC}"
    make -s ARCH=${ARCH} O=${objdir} ${CONFIG_FILE} -j$(nproc --all)

    cd ${kernel_dir}
    echo -e ${LGR} "######### Compiling kernel #########${NC}"
    make -j$(nproc --all) \
    O=out \
    ARCH=${ARCH}\
    CC="ccache clang" \
    CLANG_TRIPLE="aarch64-linux-gnu-" \
    CROSS_COMPILE="aarch64-linux-gnu-" \
    CROSS_COMPILE_ARM32="arm-linux-gnueabi-" \
    LLVM=1 \
    LLVM_IAS=1

    cd ${objdir}
    COMPILED_IMAGE=arch/arm64/boot/Image
    COMPILED_DTBO=arch/arm64/boot/dtbo.img
    if [[ -f ${COMPILED_IMAGE} && ${COMPILED_DTBO} ]]; then

        echo -e ${LGR} "#### build completed successfully (hh:mm:ss) ####"
    else
        echo -e ${RED} "#### failed to build some targets (hh:mm:ss) ####"
    fi
