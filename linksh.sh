#!/bin/bash

#
# Create a symbolic link to a .sh script file.
#
# Features:
# - remove script .sh suffix to the link name (e.g. linking 'myscrpt.sh' will create 'myscript' link);
# - add execution permission to the .sh script.
#

# Check arguments count
if [ "$#" -ne 1 ]; then
	echo "Usage: linksh [script.sh]"
	exit 1
fi

# Check if file exists and its suffix
if [ ! -f $1 ] || [[ ${1: -3} != .sh ]]; then
	echo "linksh: File '$1' not found or suffix differs from '.sh'"
	exit 1
fi	

CANONICAL_FILENAME=$(readlink -f $1)
LINK_NAME=$(basename -s .sh $CANONICAL_FILENAME)

# Script file exists: change permissions and create the symbolic link
chmod u+x $CANONICAL_FILENAME
ln -s $CANONICAL_FILENAME $LINK_NAME
