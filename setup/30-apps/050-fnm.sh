#!/usr/bin/env bash

if ! command_exists node; then
  if command_exists fnm; then
    fnm install 24
  fi
fi