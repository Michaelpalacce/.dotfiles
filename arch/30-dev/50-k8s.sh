#!/usr/bin/env bash

# k8s
yay --noconfirm -S kubectl fluxcd helm velero

if [ "$MINIMAL" == false ]; then
fi

