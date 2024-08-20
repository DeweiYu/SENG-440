#!/bin/sh

# Compile the C file to assembly with optimizations
/opt/arm/4.3.2/bin/arm-linux-gcc -mfloat-abi=softfp -static -O3 -S /tmp/dev/seng440/improvised_v2.c

# Compile the assembly file to an executable
/opt/arm/4.3.2/bin/arm-linux-gcc -static -o /tmp/dev/seng440/improvised_v2.exe /tmp/dev/seng440/improvised_v2.s

# Upload the executable to the ARM server using lftp
lftp -c "open -u user3,q6coHjd7P arm; put /tmp/dev/seng440/improvised_v2.exe"
