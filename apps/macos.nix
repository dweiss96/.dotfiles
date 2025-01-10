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
  
  # somehow presents a warning that SfSymbols6 is marked as broken
  # nixcasks.sf-symbols
]
