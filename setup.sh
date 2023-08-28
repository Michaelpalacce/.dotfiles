#!/bin/bash

ansible-playbook Home/ansible/playbooks/main/main.yml -b -K

FOLDERS=("nvim")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done
