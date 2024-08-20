# SENG 440 - Matrix Inversion Project

This project calculates the inverse of a 4x4 matrix using Gauss-Jordan Elimination.

## Matrix Inversion
The program provided in this repository (`improvised_v2.c`) computes the inverse of a 4x4 matrix using the Gauss-Jordan Elimination method.

## Compile and Run on Windows
To compile and run the program on a Windows environment:
gcc improvised_v2.c -o improvised_v2.exe; .\improvised_v2.exe

## To install on ARM
    - log into UVic VPN
    - ssh seng440.ece.uvic.ca
    - login using your uvic credentials
    - cd / ; mkdir tmp/dev ; cd tmp/dev/ ; git clone https://github.com/DeweiYu/SENG-440.git ; chmod 777 ./seng440 -R ; cd ./seng440 ; ./scripts/linux/compile.sh
    -  git stash ; git pull ; chmod 777 . -R ; ./scripts/linux/compile.

## Reset on linux
    - ./scripts/linux/reset

## Simulate ARM
    - qemu-arm main.exe

## Pipeline Commands
    - git commit -m "testing" -a | git push
    - git stash ; git pull ; chmod 777 . -R ; ./scripts/linux/compile.sh

## VM Instructions
    - qemu-system-arm -m 1G -smp 1 -hda Fedora-Minimal-armhfp-29-1.2-sda.qcow2 -machine virt-2.11 -kernel vmlinuz-4.18.16-300.fc29.armv7hl -initrd initramfs-4.18.16-300.fc29.armv7hl.img  -append "console=ttyAMA0 rw root=LABEL=_/ rootwait ipv6.disable=1" -nographic -netdev user,id=seng440,hostfwd=tcp::2222-:22 -device virtio-net-pci,netdev=seng440
    - Username: root
    - Password: seng440
    - git pull ; gcc improvised_v2.c -march=armv7-a -o mytest ; ./mytest
