#!/usr/bin/env bash

if command_exists ufw; then
  # Allow nothing in, everything out
  sudo ufw default deny incoming
  sudo ufw default allow outgoing

  # Allow SSH in
  sudo ufw allow 22/tcp

  # Allow Docker containers to use DNS on host
  sudo ufw allow in on docker0 to any port 53

  # Turn on the firewall
  sudo ufw enable

  # Turn on Docker protections
  sudo ufw-docker install
  sudo systemctl restart ufw
  sudo ufw reload
fi
