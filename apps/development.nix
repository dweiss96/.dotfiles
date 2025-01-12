{ pkgs, ... }:
with pkgs;let
  # imports of custom packages or specially preconfigured toolchains
  rustlang = import ./custom_packages/rustlang.nix;
in

with pkgs; [
  # git stuff
  diff-so-fancy
  difftastic
  git-extras
  git-secrets
  gitlab-ci-local
  gitleaks
  tig

  # toolchain NodeJS
  nodejs_22
  yarn

  # toolchain java and derivates
  jdk21
  maven
  sbt
  scala
  kotlin

  # toolchain Python 
  python314
  pyenv
  
  # toolchain Rust
  rustlang

  # toolchains misc.
  dart-sass
  flutter327
  gcc
  go
  meson
  php
  ruby
  sqlite
  zig

  # tools
  act
  ansible
  autoconf
  automake
  azure-cli
  bazel
  dep-tree
  jq
  ninja
  podman
  podman-tui
  qemu
  sqlitebrowser
  yq
]
