#!/bin/bash

#
# Build U-Boot image when `mkimage' tool is available.
#

MKIMAGE=$(type -path "${CROSS_COMPILE}mkimage")

if [ -z "${MKIMAGE}" ]; then
	MKIMAGE=$(type -path mkimage)
	if [ -z "${MKIMAGE}" ]; then
		# Doesn't exist
		echo '"mkimage" command not found - U-Boot images will not be built' >&2
		exit 1;
	fi
fi

# Call "mkimage" to create U-Boot image
${MKIMAGE} "$@"

if grep "CONFIG_LOCALVERSION=\"-uc8100\"" "${srctree}/.config" > /dev/null; then
	/bin/bash -c 'echo -e -n "\x04\x00\x04" >> ${srctree}/arch/arm/boot/uImage'
fi
