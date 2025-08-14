#!/usr/bin/env bash

# k8s
yay --noconfirm -Su kubectl fluxcd helm velero

if [ "$MINIMAL" == false ]; then
fi

