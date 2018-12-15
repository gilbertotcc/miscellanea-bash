#!/bin/bash

#
# Return host's external/public IP using dig(1) and DNS
#

DIG=$(which dig)
if [[ -z $DIG ]]; then
	echo "ipofme requires dig(1) which has not been found"
	exit 1
fi
$DIG @resolver1.opendns.com ANY myip.opendns.com +short
