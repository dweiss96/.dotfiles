{ pkgs, ... }:
let
  nixcasks = import (fetchTarball "https://github.com/jacekszymanski/nixcasks/archive/master.tar.gz") {
    inherit pkgs;
    osVersion = "sonoma";
  };
in
[
  pkgs.jankyborders
  pkgs.cocoapods
  pkgs.mas
  
  pkgs.yabai
  pkgs.skhd

  nixcasks.jordanbaird-ice
  nixcasks.shortcat
  nixcasks.itsycal
  nixcasks.unnaturalscrollwheels

  nixcasks.android-studio
  # nixcasks.azure-data-studio # causes build failure
  nixcasks.docker
  nixcasks.firefox
  nixcasks.insomnia
  nixcasks.krita
  nixcasks.mattermost
  nixcasks.microsoft-azure-storage-explorer
  nixcasks.obsidian
  nixcasks.readdle-spark
  nixcasks.thunderbird
  nixcasks.tidal
  nixcasks.vlc
  nixcasks.yubico-authenticator

  
  # somehow presents a warning that SfSymbols6 is marked as broken
  # nixcasks.sf-symbols
]
