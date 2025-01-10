let
  rust_overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
in
  # use minimal since rust-docs seem to cause slow installation 
  nixpkgs.rust-bin.stable.latest.minimal.override {
    extensions = [
      "clippy"
      "rust-src"
      "rustfmt"
      "rust-analyzer"
    ];
  }
