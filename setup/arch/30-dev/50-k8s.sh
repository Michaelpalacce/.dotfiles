#!/usr/bin/env bash

# k8s
yay --noconfirm -S --needed kubectl fluxcd helm velero

if [ "$MINIMAL" == false ]; then
fi

