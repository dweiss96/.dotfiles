{ pkgs, ... }:
let
  nixcasks = import (fetchTarball "https://github.com/jacekszymanski/nixcasks/archive/master.tar.gz") {
    inherit pkgs;
    osVersion = "sonoma";
  };
in
with pkgs; [
  pkgs.jankyborders
  pkgs.cocoapods
  pkgs.mas

  nixcasks.rustdesk
  # maybe missing nix-darwin because accessibility requests fail
  # yabai
  # skhd
]
