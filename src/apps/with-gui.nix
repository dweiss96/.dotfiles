{ pkgs, ... }:
let
  # vscode = import ./custom_packages/vscode-with-extensions.nix;
in
with pkgs; [
  audacity
  brave
  discord
  gimp
  inkscape-with-extensions
  wireguard-tools
]
