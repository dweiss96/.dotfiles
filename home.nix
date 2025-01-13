{ config, pkgs, lib, ... }:
let
  userConfig = import ./config.nix;
  appConfiguration = import ./src/all-packages.nix config pkgs lib userConfig;
  linkedDotfiles = import ./src/linked-dotfiles.nix config;
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = userConfig.username;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "24.11";
    packages = appConfiguration.packages;
    file = lib.mkMerge [
      linkedDotfiles
      appConfiguration.additionalSdks
    ];
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = lib.mkMerge [
    { home-manager.enable = true; } # Let Home Manager install and manage itself.
    appConfiguration.programs
  ];

  imports = appConfiguration.imports ++ [
  ];
}
