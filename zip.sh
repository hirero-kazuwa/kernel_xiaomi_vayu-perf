#!/bin/bash

LGR='\033[1;32m'

    echo "Copying files to dir"
    cd AnyKernel3 &&
    zip -r franxx_vayu-kernel$(date +"%d%m%Y-%H%M").zip * &&
    mv *.zip /home/hirero
