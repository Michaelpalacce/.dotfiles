#!/usr/bin/env bash

# Gemini
yay --noconfirm -S gemini-cli-bin

yay --noconfirm -S opencode-bin claude-code openai-codex-bin

if [[ "$MINIMAL" == false ]]; then
    yay --noconfirm -S --needed lmstudio
fi