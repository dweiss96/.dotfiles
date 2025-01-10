{ config, pkgs, ... }:
let
  mac-app-util-src = builtins.fetchTarball "https://github.com/hraban/mac-app-util/archive/master.tar.gz";
  mac-app-util = import mac-app-util-src {};

  userConfig = import ./config.nix;

  apps_tools = import ./apps/tools.nix pkgs;
  apps_development = import ./apps/development.nix pkgs;

  apps_platform = if pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin" then
    import ./apps/macos.nix pkgs
  else
    import ./apps/linux.nix pkgs
  ;

  fonts = with pkgs; [
    fira-code
  ];
in
{
  home = {
    username = userConfig.username;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "24.11";
    packages = fonts ++ apps_tools ++ apps_platform ++ apps_development;
    file = {
      # ".oh-my-zsh".source = config.lib.file.mkOutOfStoreSymlink ./config_files/oh-my-zsh;
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink ./config_files/zshrc;
      ".tigrc".source = config.lib.file.mkOutOfStoreSymlink ./config_files/tigrc;
      ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink ./config_files/p10k.zsh;

      ".config/borders".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/borders;
      ".config/erdtree".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/erdtree;
      ".config/htop".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/htop;
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/nvim;
      ".config/sketchybar".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/sketchybar;
      ".config/skhd".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/skhd;
      ".config/yabai".source = config.lib.file.mkOutOfStoreSymlink ./config_files/without_module/yabai;
      ".config/zed/themes/catppuccin-pink.json".source = config.lib.file.mkOutOfStoreSymlink ./config_files/zed-theme.catppuccin-pink.json;

      ".sdks/jdk/jdk11".source = pkgs.jdk11;
      ".sdks/jdk/jdk17".source = pkgs.jdk17;
      ".sdks/jdk/jdk21".source = pkgs.jdk21;
      ".sdks/jdk/scala".source = pkgs.scala;
    };
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh.enable = true;

  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.alacritty.enable = true;

  programs.git = import ./programs/git.nix userConfig.gitFullName userConfig.gitMail;
  programs.btop = import ./programs/btop.nix;
  programs.helix = import ./programs/helix.nix;
  programs.zed-editor = import ./programs/zed-editor.nix;
  # programs.vscode = import ./programs/vscode.nix pkgs;

  imports = [
    mac-app-util.homeManagerModules.default
  ];
}
