#!/usr/bin/env bash

ln -s $(pwd)/src/nixos_cfgs/$1/configuration.nix /etc/nixos/configuration.nix
ln -s $(pwd)/src/nixos_cfgs/$1/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
