#!/usr/bin/env bash

# Rust and cargo are needed for different tools

yay --noconfirm -S --needed rustup cargo

# Needed for rust builds (rustdesk for example)
rustup default stable
