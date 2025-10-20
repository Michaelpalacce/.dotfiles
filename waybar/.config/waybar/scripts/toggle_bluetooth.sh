#!/bin/bash

# Get current Bluetooth power state
state=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$state" = "yes" ]; then
    # Turn off Bluetooth
    bluetoothctl power off
else
    # Turn on Bluetooth
    bluetoothctl power on
fi