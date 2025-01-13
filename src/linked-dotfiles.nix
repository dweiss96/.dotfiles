config: {
  ".zshrc".source = config.lib.file.mkOutOfStoreSymlink ../config_files/zshrc;
  ".tigrc".source = config.lib.file.mkOutOfStoreSymlink ../config_files/tigrc;
  ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink ../config_files/p10k.zsh;

  ".config/borders".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/borders;
  ".config/erdtree".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/erdtree;
  ".config/htop".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/htop;
  ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/nvim;
  ".config/sketchybar".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/sketchybar;
  ".config/skhd".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/skhd;
  ".config/yabai".source = config.lib.file.mkOutOfStoreSymlink ../config_files/without_module/yabai;
  ".config/zed/themes/catppuccin-pink.json".source = config.lib.file.mkOutOfStoreSymlink ../config_files/zed-theme.catppuccin-pink.json;
  ".config/alacritty/catpuccin_mocha_theme.toml".source = config.lib.file.mkOutOfStoreSymlink ../config_files/alacritty.catpuccin_mocha_theme.toml;
}
