#!/bin/bash

if pgrep -f gpu-screen-recorder >/dev/null; then
    echo '{"text":"","tooltip":"Recording…"}'
else
    echo '{"text":"","tooltip":"Press To Record!"}'
fi

