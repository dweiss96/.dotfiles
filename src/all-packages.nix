config: pkgs: lib: userConfig:
let
  macAppUtil = import (builtins.fetchTarball "https://github.com/hraban/mac-app-util/archive/master.tar.gz") {};

  fonts = import ./apps/fonts.nix pkgs;
  cliApps = import ./apps/cli.nix pkgs;
  devTools = import ./apps/development.nix pkgs;
  guiApps = import ./apps/with-gui.nix pkgs;

  platformApps = if pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin" then
    import ./apps/macos.nix pkgs
  else
    import ./apps/linux.nix pkgs
  ;
in

{
  packages = fonts ++ cliApps ++ devTools.global ++ guiApps ++ platformApps;
  additionalSdks = devTools.additionalSdks;
  programs = {
    zsh.enable = true;
    zsh.oh-my-zsh.enable = true;
    vim.enable = true;
    neovim.enable = true;
    alacritty = import ./apps/programs/alacritty.nix;
    git = import ./apps/programs/git.nix userConfig.gitFullName userConfig.gitMail;
    btop = import ./apps/programs/btop.nix;
    helix = import ./apps/programs/helix.nix;
    vscode = import ./apps/programs/vscode.nix pkgs;
    zed-editor = import ./apps/programs/zed-editor.nix;
  };
  imports = [
    macAppUtil.homeManagerModules.default
  ];
}