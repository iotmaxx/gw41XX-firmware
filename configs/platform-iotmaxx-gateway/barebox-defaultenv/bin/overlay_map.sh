#!/bin/sh

global board.overlay_id

EEPROM="/dev/eeprom0"

# ID is the first 16 bytes
if test -e $EEPROM; then
    echo "Reading ID from $EEPROM"
    if memcpy -s $EEPROM -d tmp_overlay_id -b 0 0 16; then
	readf tmp_overlay_id global.board.overlay_id
    fi
    echo "Loading overlay $global.board.overlay_id"

    if [ $state.bootstate.last_chosen == 0 ]; then
	PATH="/mnt/${nv.bootchooser.system0.boot}/loader/entries/${global.board.overlay_id}.dto"
	if test -e $PATH; then
	    of_overlay $PATH
	else
	    echo "$PATH not found"
	    exit 1
	fi
    elif [ $state.bootstate.last_chosen == 1 ]; then
	PATH="/mnt/${nv.bootchooser.system1.boot}/loader/entries/${global.board.overlay_id}.dto"
	if test -e $PATH; then
	    of_overlay $PATH
	else
	    echo "$PATH not found"
	    exit 1
	fi
    fi
fi
[ -f tmp_overlay_id ] && rm tmp_overlay_id

