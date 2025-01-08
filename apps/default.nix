let
  pkgs = import <nixpkgs> { };
  tools = import ./categories/tools.nix pkgs;
  devApps = import ./categories/development.nix pkgs;

  platformApps = if pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin" then 
    import ./categories/macos.nix pkgs
  else
    import ./categories/linux.nix pkgs
  ;
in

tools ++ devApps ++ platformApps
