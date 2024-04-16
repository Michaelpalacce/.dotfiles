#!/usr/bin/env bash
set -e
pushd ~/.dotfiles/nix/

nvim configuration.nix
git diff -U0 *.nix
echo "NixOS Rebuilding..."

sudo nixos-rebuild switch -I nixos-config=configuration.nix || exit 1
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
