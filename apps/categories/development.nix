{ pkgs, ... }:

with pkgs;
let
  # imports of custom packages
  rustlang = import ./custom_packages/rustlang.nix;
  vscode = import ./custom_packages/vscode-with-extensions.nix;

  git_stuff = [
    diff-so-fancy
    difftastic
    git
    git-extras
    git-lfs
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
    jdk11
    jdk17
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
    zig
  ];

  ide = vscode ++ [
    helix
    vim
    neovim
  ];

  tools = [
    act
    ansible
    bazel
    autoconf
    automake
    azure-cli
    dep-tree
    yq
    jq
    qemu
    podman
  ];
in

git_stuff ++ toolchains ++ ide ++ tools
