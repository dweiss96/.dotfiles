config: pkgs: {
  ".zshrc".source = config.lib.file.mkOutOfStoreSymlink ../config_files/zshrc;
  ".tigrc".source = config.lib.file.mkOutOfStoreSymlink ../config_files/tigrc;
  ".wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink ../config_files/wezterm.lua;
  ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink ../config_files/p10k.zsh;
  ".aerospace.toml".source = config.lib.file.mkOutOfStoreSymlink ../config_files/aerospace.toml;

  ".cargo/config.toml" = import files/cargo-config-toml.nix pkgs;

  ".config/borders".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/borders;
  ".config/erdtree".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/erdtree;
  ".config/htop".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/htop;
  ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/hypr;
  ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/nvim;
  ".config/sketchybar".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/sketchybar;
  ".config/skhd".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/skhd;
  ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/waybar;
  ".config/yabai".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/yabai;
  ".config/zed/themes/catppuccin-pink.json".source = config.lib.file.mkOutOfStoreSymlink ../config_files/zed-theme.catppuccin-pink.json;
  ".config/alacritty/catpuccin_mocha_theme.toml".source = config.lib.file.mkOutOfStoreSymlink ../config_files/alacritty.catpuccin_mocha_theme.toml;
}
