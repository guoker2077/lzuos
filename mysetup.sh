wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-13.1.tar.xz
tar -xvf gdb-13.1.tar.xz
cd gdb-13.1
mkdir build && cd build
../configure --prefix=/usr/local --target=riscv64-unknown-elf --enable-tui=yes
make -j$(nproc)
sudo make install
riscv64-unknown-elf-gdb -v
rm -rf build