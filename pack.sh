#!/bin/bash
if ! [[ -d ./vendor ]]; then mkdir ./vendor; fi
if ! [[ -d ./insmod ]]; then mkdir ./insmod; fi
if ! [[ -d ./bins ]]; then mkdir ./bins; fi

sudo mount ./vendor.img ./vendor

# copy firmware blob
if [[ "$(ls ./bins | wc -l)" -ne 0 ]]; then
	sudo cp ./bins/* ./vendor/firmware/ -r
fi
# copy kernel object files
if [[ "$(ls ./insmod | wc -l)" -ne 0 ]]; then
	sudo cp ./insmod/* ./vendor/lib/modules/ -r
fi

sudo sync
sudo umount ./vendor
echo 'Success!'
