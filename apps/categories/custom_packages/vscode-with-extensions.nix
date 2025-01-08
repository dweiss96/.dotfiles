let
  vscode_overlay = import (builtins.fetchGit "https://github.com/nix-community/nix-vscode-extensions");
  nixpkgs = import <nixpkgs> { overlays = [ vscode_overlay ]; };
in

[
  nixpkgs.vscodium

  # theme
  nixpkgs.vscode-marketplace-release.catppuccin.catppuccin-vsc
  nixpkgs.vscode-marketplace-release.catppuccin.catppuccin-vsc-icons
  nixpkgs.vscode-marketplace-release.github.github-vscode-theme

  # PHP
  nixpkgs.vscode-marketplace-release.devsense.composer-php-vscode
  nixpkgs.vscode-marketplace-release.devsense.intelli-php-vscode
  nixpkgs.vscode-marketplace-release.devsense.phptools-vscode
  nixpkgs.vscode-marketplace-release.devsense.profiler-php-vscode
  nixpkgs.vscode-marketplace-release.rexshi.phpdoc-comment-vscode-plugin
  nixpkgs.vscode-marketplace-release.thenouillet.symfony-vscode
  nixpkgs.vscode-marketplace-release.mehedidracula.php-namespace-resolver
  # TWIG
  nixpkgs.vscode-marketplace-release.whatwedo.twig
  nixpkgs.vscode-marketplace-release.junstyle.twig-language
  nixpkgs.vscode-marketplace-release.mblode.twig-language-2
  nixpkgs.vscode-marketplace-release.serhatkaya.twig-formatter
  # SCSS/CSS
  nixpkgs.vscode-marketplace-release.ecmel.vscode-html-css
  nixpkgs.vscode-marketplace-release.mrmlnc.vscode-scss
  
  # JS
  nixpkgs.vscode-marketplace-release.svelte.svelte-vscode
  nixpkgs.vscode-marketplace-release.angular.ng-template
  nixpkgs.vscode-marketplace-release.vue.volar

  # Python
  nixpkgs.vscode-marketplace-release.ms-python.debugpy
  nixpkgs.vscode-marketplace-release.ms-python.python
  nixpkgs.vscode-marketplace-release.ms-python.vscode-pylance

  # Rust
  nixpkgs.vscode-marketplace-release.rust-lang.rust-analyzer
  nixpkgs.vscode-marketplace-release.swellaby.vscode-rust-test-adapter
  nixpkgs.vscode-marketplace-release.slint.slint

  # Golang
  nixpkgs.vscode-marketplace-release.golang.go

  # Java
  nixpkgs.vscode-marketplace-release.vscjava.vscode-gradle
  nixpkgs.vscode-marketplace-release.vscjava.vscode-java-debug
  nixpkgs.vscode-marketplace-release.vscjava.vscode-java-dependency
  nixpkgs.vscode-marketplace-release.vscjava.vscode-java-pack
  nixpkgs.vscode-marketplace-release.vscjava.vscode-java-test
  nixpkgs.vscode-marketplace-release.vscjava.vscode-maven
  nixpkgs.vscode-marketplace-release.redhat.java
  
  # Scala
  nixpkgs.vscode-marketplace-release.scala-lang.scala
  nixpkgs.vscode-marketplace-release.scalameta.metals

  # text tools
  nixpkgs.vscode-marketplace-release.bibhasdn.unique-lines
  nixpkgs.vscode-marketplace-release.aykutsarac.jsoncrack-vscode
  nixpkgs.vscode-marketplace-release.mechatroner.rainbow-csv
  nixpkgs.vscode-marketplace-release.redhat.vscode-xml
  nixpkgs.vscode-marketplace-release.ryu1kn.partial-diff

  # Git
  nixpkgs.vscode-marketplace-release.solomonkinard.git-blame
  nixpkgs.vscode-marketplace-release.waderyan.gitblame

  # DevOps
  nixpkgs.vscode-marketplace-release.ms-vscode-remote.remote-containers
  nixpkgs.vscode-marketplace-release.ms-azuretools.vscode-docker
  nixpkgs.vscode-marketplace-release.github.vscode-github-actions

  # Testing
  nixpkgs.vscode-marketplace-release.hbenl.vscode-test-explorer
  nixpkgs.vscode-marketplace-release.ms-vscode.test-adapter-converter

  # other tools
  nixpkgs.vscode-marketplace-release.jock.svg
  nixpkgs.vscode-marketplace-release.tomoki1207.pdf
  nixpkgs.vscode-marketplace-release.thomas-baumgaertner.vcl
  nixpkgs.vscode-marketplace-release.bbenoist.nix
  nixpkgs.vscode-marketplace-release.visualstudioexptteam.intellicode-api-usage-examples
  nixpkgs.vscode-marketplace-release.visualstudioexptteam.vscodeintellicode
]
