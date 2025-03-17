pkgs:
{
  enable = true;
  package = pkgs.vscodium;
  profiles = {
    default = {
      userSettings = {
        "editor.fontFamily" = "Fira Code, Menlo, Monaco, 'Courier New', monospace";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.startupEditor" = "none";
        "files.autoSave" = "onFocusChange";
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "files.exclude" = {
            "**/node_modules" = true;
        };
        "javascript.updateImportsOnFileMove.enabled" = "never";
        "pieces.setCopilotLocation" = true;
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.fontLigatures" = true;
        "[twig]" = {
            "editor.defaultFormatter" = "serhatkaya.twig-formatter";
        };
        "redhat.telemetry.enabled" = false;
        "files.watcherExclude" = {
            "**/.bloop" = true;
            "**/.metals" = true;
            "**/.ammonite" = true;
        };
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "editor.stickyScroll.enabled" = false;
        "workbench.iconTheme" = "catppuccin-mocha";
        "php.validate.executablePath" = "${pkgs.php}/bin/php";
        "phpserver.phpPath" = "${pkgs.php}/bin/php";
        "symfony-vscode.phpExecutablePath" = "${pkgs.php}/bin/php";
        "intelephense.telemetry.enabled" = false;
      };
      extensions = with pkgs.vscode-extensions; [
        # theme
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        github.github-vscode-theme

        # PHP
        devsense.composer-php-vscode
        devsense.profiler-php-vscode

        # SCSS/CSS
        ecmel.vscode-html-css

        # JS
        svelte.svelte-vscode
        angular.ng-template
        vue.volar

        # Python
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance

        # Rust
        rust-lang.rust-analyzer

        # Golang
        golang.go

        # Java
        vscjava.vscode-gradle
        vscjava.vscode-java-debug
        vscjava.vscode-java-dependency
        vscjava.vscode-java-pack
        vscjava.vscode-java-test
        vscjava.vscode-maven
        redhat.java


        # Scala
        scala-lang.scala
        scalameta.metals

        # text tools
        mechatroner.rainbow-csv
        redhat.vscode-xml
        ryu1kn.partial-diff

        # Git
        waderyan.gitblame

        # DevOps
        ms-vscode-remote.remote-containers
        ms-azuretools.vscode-docker
        github.vscode-github-actions

        # Testing
        hbenl.vscode-test-explorer
        ms-vscode.test-adapter-converter

        # other tools
        jock.svg
        tomoki1207.pdf
        bbenoist.nix
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode

        bmewburn.vscode-intelephense-client
       ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # PHP
        {
          name = "phpdoc-comment-vscode-plugin";
          publisher = "rexshi";
          version = "1.3.0";
          sha256 = "1yv4lwzi116jf2rcb5cbbjb5xqv29vbwn4wc568nd9cdi1782hd2";
        }
        {
          name = "symfony-vscode";
          publisher = "thenouillet";
          version = "1.0.2";
          sha256 = "0qb99mkisykkzb0lbf4r94l677m408bkmxirmz4xjcha1gkchifw";
        }
        {
          name = "php-namespace-resolver";
          publisher = "mehedidracula";
          version = "1.1.9";
          sha256 = "1fqxsxs8sg6kpxh2yksvgwwzqfi436x2y8h2gqxiqmxfln8k21b2";
        }

        # TWIG
        {
          name = "twig";
          publisher = "whatwedo";
          version = "1.0.2";
          sha256 = "0d552g0g9c5pmak4b9kjqr6z4rah276xs45lijv1hrs04jfwl8pr";
        }
        {
          name = "twig-language";
          publisher = "junstyle";
          version = "0.10.15";
          sha256 = "0bvlf1l5g8wwh0irnc91m9637xyp3cbfhq9nzlj353vjz8rwn0dv";
        }
        {
          name = "twig-language-2";
          publisher = "mblode";
          version = "0.9.4";
          sha256 = "09djdw6lipjbfgh8nmgm8nr3pr27cif04yv6imz33ch0af0k5dr5";
        }
        {
          name = "twig-formatter";
          publisher = "serhatkaya";
          version = "1.0.0";
          sha256 = "0ylq3fal8faqz64jb4fmr95fgd9bkisq632f28akq573cc24yx5w";
        }


        # SCSS/CSS
        {
          name = "vscode-scss";
          publisher = "mrmlnc";
          version = "0.10.0";
          sha256 = "08kdvg4p0aysf7wg1qfbri59cipllgf69ph1x7aksrwlwjmsps12";
        }

        # Rust
        {
          name = "vscode-rust-test-adapter";
          publisher = "swellaby";
          version = "0.11.0";
          sha256 = "111vhl71zzh4il1kh21l49alwlllzcvmdbsxyvk9bq3r24hxq1r2";
        }
        {
          name = "slint";
          publisher = "slint";
          version = "1.9.2";
          sha256 = "0qyz0ma8liblvfpqv2ylahp93a9f4pqv4habqgbbg52baw7ssv6j";
        }
        {
          name = "tera";
          publisher = "karunamurti";
          version = "0.0.9";
          sha256 = "1pykbdfvbhdj1kj7l3s8ri88v24m96x4c848qacz1zizg1jsbgbv";
        }

        # text tools
        {
          name = "unique-lines";
          publisher = "bibhasdn";
          version = "1.0.0";
          sha256 = "1x0lkdvc0247bms200nn2z5m7qaq9lg96ppbgk6lg3mgmxknjijv";
        }
        {
          name = "jsoncrack-vscode";
          publisher = "aykutsarac";
          version = "2.0.3";
          sha256 = "0pa49xg63la6gz5q652h25i2mf7wlj90rch9mpprwnbj9rw4qrb2";
        }


        # Git
        {
          name = "git-blame";
          publisher = "solomonkinard";
          version = "0.2.58";
          sha256 = "1168nzgjli8gci4smp3fjiaqddddcgsv9zz9d16hz7v3aj2yk7ck";
        }

        # other tools
        {
          name = "vcl";
          publisher = "thomas-baumgaertner";
          version = "0.1.2";
          sha256 = "074yjl93l8n8033f513l9mqrz646j0bmgx019l2192n7d241ggnb";
        }
      ];
    };
  };
}
