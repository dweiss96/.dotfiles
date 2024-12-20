let
  pkgs = import <nixpkgs> {};
  defaultApps = import ./apps/default.nix pkgs;

  platformApps = if pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin" then 
    import ./apps/macos.nix pkgs
  else
    import ./apps/linux.nix pkgs
  ;
in

defaultApps ++ platformApps
