#!/bin/bash

#MAIN_RESOLUTION='1920x1080'
SECCOND_RESOLUTION='1920x1080'
MAIN_DEVICE='eDP1'
SECCOND_DEVICE='HDMI2'
POSITION='right'		# right / left / ...

xrandr --auto --output $SECCOND_DEVICE --mode $SECCOND_RESOLUTION --$POSITION-of $MAIN_DEVICE

