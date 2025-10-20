#!/bin/bash

if pgrep -f gpu-screen-recorder >/dev/null; then
    pkill -f gpu-screen-recorder
else
    gpu-screen-recorder -w screen -o ~/Videos/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4 &
fi