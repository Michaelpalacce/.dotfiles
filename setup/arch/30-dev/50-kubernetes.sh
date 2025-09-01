#!/usr/bin/env bash

#@TODO: Add install of clusterawsadm
# k8s
yay --noconfirm -S --needed kubectl fluxcd helm velero clusterctl

if [ "$MINIMAL" == false ]; then
fi

