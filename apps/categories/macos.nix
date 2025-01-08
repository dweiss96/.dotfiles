{ pkgs, ... }:

with pkgs; [
  jankyborders
  cocoapods
  mas

  # maybe missing nix-darwin because accessibility requests fail
  # yabai
  # skhd
]
