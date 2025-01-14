{ pkgs, ... }:
with pkgs;let
  # imports of custom packages or specially preconfigured toolchains
  rustlang = import ./custom_packages/rustlang.nix;
in

with pkgs; {
  global = [
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
    poetry
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
    libiconv

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
  ];

  additionalSdks = {
    ".sdks/jdk/jdk11".source = pkgs.jdk11;
    ".sdks/jdk/jdk17".source = pkgs.jdk17;
    ".sdks/jdk/jdk21".source = pkgs.jdk21;
    ".sdks/jdk/scala".source = pkgs.scala;
  };
}
