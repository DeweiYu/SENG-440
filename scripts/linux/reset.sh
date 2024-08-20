#!/usr/bin/sh

# Fetch all changes from the repository and reset local changes
git fetch --all
git reset --hard
git pull

# Set permissions recursively
chmod 777 . -R

# Check if the "-c" argument is provided
if [ "$1" = "-c" ]; then
  # Compile the C file to assembly with optimizations
  /opt/arm/4.3.2/bin/arm-linux-gcc -mfloat-abi=softfp -static -O3 -S /tmp/seng440/improvised_v2.c
  
  # Compile the assembly file to an executable
  /opt/arm/4.3.2/bin/arm-linux-gcc -static -o /tmp/seng440/improvised_v2.exe /tmp/seng440/improvised_v2.s
  
  # Upload the executable to the ARM server using lftp
  lftp -c "open -u user4,q6coHjd7P arm; put /tmp/seng440/improvised_v2.exe"
fi
