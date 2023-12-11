#!/usr/bin/env bash

## If you see an error message that says
## Qemu stderr: Could not access KVM kernel module: Permission denied

## Then 
## sudo usermod -a -G kvm $USER 
## sudo usermod -a -G libvirtd $USER 

## If you are seeing error Qemu stderr: gtk initialization failed
##

base_config_dir="./packer/base-config"
# source config-build.sh

export PACKER_LOG=1
export PACKER_LOG_PATH="z-packer.log"

echo $WIN2019_KEY
echo $WIN10_KEY

# Add Product Keys
# Windows 2019 Key
#cp -f "$base_config_dir/windows2019/autounattend-template.xml" "$base_config_dir/windows2019/autounattend.xml"
#sed -i -e "s/\*\*ProductKey\*\*/$WIN2019_KEY/g" "$base_config_dir/windows2019/autounattend.xml"
#echo $WIN2019_KEY

# Windows 10 Key
#cp -f "$base_config_dir/windows10/autounattend-template.xml" "$base_config_dir/windows10/autounattend.xml"
#sed -i -e "s/\*\*ProductKey\*\*/$WIN10_KEY/g" "$base_config_dir/windows10/autounattend.xml"
#echo $WIN10_KEY

#packer build -force packer/ubuntu-server-22-04.json 
#packer build -force packer/windows-10-22H2.json
#packer build -force packer/windows-server-2019.json

# Remove Autounattend.xml files with Secrets
# rm -rf "${base_config_dir}/windows2019/autounattend.xml"
# rm -rf "${base_config_dir}/windows10/autounattend.xml"
