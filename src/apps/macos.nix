{ pkgs, ... }:
let
  nixcasks = import (fetchTarball "https://github.com/jacekszymanski/nixcasks/archive/master.tar.gz") {
    inherit pkgs;
    osVersion = "sonoma";
  };
in
[
  pkgs.cocoapods
  pkgs.mas

  pkgs.yabai
  pkgs.skhd
  pkgs.aerospace
  pkgs.jankyborders
  pkgs.sketchybar
  pkgs.docker
  pkgs.utm

  nixcasks.ubersicht
  nixcasks.jordanbaird-ice
  nixcasks.itsycal
  nixcasks.unnaturalscrollwheels

  nixcasks.android-studio
  # nixcasks.azure-data-studio # causes build failure
  pkgs.docker
  nixcasks.firefox
  nixcasks.krita
  nixcasks.mattermost
  nixcasks.microsoft-azure-storage-explorer
  nixcasks.obsidian
  nixcasks.thunderbird
  nixcasks.tidal
  nixcasks.vlc
  nixcasks.wezterm
  nixcasks.yubico-authenticator


  # somehow presents a warning that SfSymbols6 is marked as broken
  # nixcasks.sf-symbols
]
