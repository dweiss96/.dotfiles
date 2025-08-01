{ config, pkgs, lib, ... }:
let
  userConfig = import ./config.nix;
  appConfiguration = import ./src/all-packages.nix config pkgs lib userConfig;
  linkedDotfiles = import ./src/linked-dotfiles.nix config pkgs;
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = userConfig.username;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "25.11";
    packages = appConfiguration.packages;
    file = lib.mkMerge [
      linkedDotfiles
      appConfiguration.additionalSdks
    ];
    sessionVariables = {
      EDITOR = "vim";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = lib.mkMerge [
    { home-manager.enable = true; } # Let Home Manager install and manage itself.
    appConfiguration.programs
  ];
}
