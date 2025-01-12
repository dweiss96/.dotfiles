{
  enable = true;
  extensions = [ "nix" ];
  userSettings = {
    autosave = "on_focus_change";
    buffer_font_family = "Fira Code";
    buffer_font_features = {
      ligatures= true;
    };
    ui_font_size = 16;
    buffer_font_size = 16;
    theme = {
      mode = "system";
      light = "One Light";
      dark = "Catppuccin Mocha (pink)";
    };
  };
}
