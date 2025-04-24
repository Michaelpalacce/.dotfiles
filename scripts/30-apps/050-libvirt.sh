#!/usr/bin/env bash

# libvirtd is a system daemon and cannot be manged by home-manager.
 
virtualization() {
    if command_exists brew; then
    elif command_exists apt-get; then
        sudo apt install -y qemu-kvm libvirt-daemon-system
        sudo adduser $USER libvirt
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

print_color "$GREEN" "installing kvm and libvirtd for emulation"
virtualization
