# Clonning the Clang
git clone https://github.com/kdrag0n/proton-clang ~/toolchains/proton-clang --depth=1
export PATH="$HOME/toolchains/proton-clang/bin:$PATH"

# Setting Up KernelSU
patch -p1 -N < kernelsu.patch
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -

# Building
make O=out beryllium_defconfig
make O=out CC=clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi-
