let
  vscode_overlay = import (builtins.fetchGit "https://github.com/nix-community/nix-vscode-extensions");
  nixpkgs = import <nixpkgs> { overlays = [ vscode_overlay ]; };
in

[
  nixpkgs.vscodium

  # theme
  nixpkgs.open-vsx-release.catppuccin.catppuccin-vsc
  nixpkgs.open-vsx-release.catppuccin.catppuccin-vsc-icons
  nixpkgs.open-vsx-release.github.github-vscode-theme

  # PHP
  nixpkgs.open-vsx-release.devsense.composer-php-vscode
  nixpkgs.open-vsx-release.devsense.intelli-php-vscode
  nixpkgs.open-vsx-release.devsense.phptools-vscode
  nixpkgs.open-vsx-release.devsense.profiler-php-vscode
  nixpkgs.open-vsx-release.rexshi.phpdoc-comment-vscode-plugin
  nixpkgs.open-vsx-release.thenouillet.symfony-vscode
  nixpkgs.open-vsx-release.mehedidracula.php-namespace-resolver
  # TWIG
  nixpkgs.open-vsx-release.whatwedo.twig
  nixpkgs.open-vsx-release.junstyle.twig-language
  nixpkgs.open-vsx-release.mblode.twig-language-2
  nixpkgs.open-vsx-release.serhatkaya.twig-formatter
  # SCSS/CSS
  nixpkgs.open-vsx-release.ecmel.vscode-html-css
  nixpkgs.open-vsx-release.mrmlnc.vscode-scss
  
  # JS
  nixpkgs.open-vsx-release.svelte.svelte-vscode
  nixpkgs.open-vsx-release.angular.ng-template
  nixpkgs.open-vsx-release.vue.volar

  # Python
  nixpkgs.open-vsx-release.ms-python.debugpy
  nixpkgs.open-vsx-release.ms-python.python
  nixpkgs.open-vsx-release.ms-python.vscode-pylance

  # Rust
  nixpkgs.open-vsx-release.rust-lang.rust-analyzer
  nixpkgs.open-vsx-release.swellaby.vscode-rust-test-adapter
  nixpkgs.open-vsx-release.slint.slint

  # Golang
  nixpkgs.open-vsx-release.golang.go

  # Java
  nixpkgs.open-vsx-release.vscjava.vscode-gradle
  nixpkgs.open-vsx-release.vscjava.vscode-java-debug
  nixpkgs.open-vsx-release.vscjava.vscode-java-dependency
  nixpkgs.open-vsx-release.vscjava.vscode-java-pack
  nixpkgs.open-vsx-release.vscjava.vscode-java-test
  nixpkgs.open-vsx-release.vscjava.vscode-maven
  nixpkgs.open-vsx-release.redhat.java
  
  # Scala
  nixpkgs.open-vsx-release.scala-lang.scala
  nixpkgs.open-vsx-release.scalameta.metals

  # text tools
  nixpkgs.open-vsx-release.bibhasdn.unique-lines
  nixpkgs.open-vsx-release.aykutsarac.jsoncrack-vscode
  nixpkgs.open-vsx-release.mechatroner.rainbow-csv
  nixpkgs.open-vsx-release.redhat.vscode-xml
  nixpkgs.open-vsx-release.ryu1kn.partial-diff

  # Git
  nixpkgs.open-vsx-release.solomonkinard.git-blame
  nixpkgs.open-vsx-release.waderyan.gitblame

  # DevOps
  nixpkgs.open-vsx-release.ms-vscode-remote.remote-containers
  nixpkgs.open-vsx-release.ms-azuretools.vscode-docker
  nixpkgs.open-vsx-release.github.vscode-github-actions

  # Testing
  nixpkgs.open-vsx-release.hbenl.vscode-test-explorer
  nixpkgs.open-vsx-release.ms-vscode.test-adapter-converter

  # other tools
  nixpkgs.open-vsx-release.jock.svg
  nixpkgs.open-vsx-release.tomoki1207.pdf
  nixpkgs.open-vsx-release.thomas-baumgaertner.vcl
  nixpkgs.open-vsx-release.bbenoist.nix
  nixpkgs.open-vsx-release.visualstudioexptteam.intellicode-api-usage-examples
  nixpkgs.open-vsx-release.visualstudioexptteam.vscodeintellicode
]
