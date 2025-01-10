{ pkgs, ... }:

with pkgs;
let
  # imports of custom packages
  rustlang = import ./custom_packages/rustlang.nix;
  # vscode = import ./custom_packages/vscode-with-extensions.nix;

  git_stuff = [
    diff-so-fancy
    difftastic
    git-extras
    git-secrets
    gitlab-ci-local
    gitleaks
    tig
  ];

  toolchains = [
    # NodeJS
    nodejs_22
    yarn

    # Java
    # jdk11
    # jdk17
    jdk21
    maven
    sbt

    # Rust
    # rustup
    # cargo
    rustlang

    # Python
    python314
    pyenv

    # other
    dart-sass
    flutter327
    gcc
    go
    meson
    php
    ruby
    sqlite
    zig
  ];

  tools = [
    act
    ansible
    autoconf
    automake
    azure-cli
    bazel
    dep-tree
    jq
    podman
    podman-tui
    qemu
    sqlitebrowser
    yq
  ];
in

git_stuff ++ toolchains ++ tools
