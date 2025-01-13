pkgs: let
  extension_repos = (import (builtins.fetchGit {
    url = "https://github.com/nix-community/nix-vscode-extensions";
    ref = "refs/heads/master";
    rev = "c43d9089df96cf8aca157762ed0e2ddca9fcd71e";
  })).extensions.${builtins.currentSystem};

  extension_packages = extension_repos.vscode-marketplace-release;
in {
  enable = true;
  package = pkgs.vscodium;
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
    "editor.stickyScroll.enabled" = false;
    "workbench.iconTheme" = "catppuccin-mocha";
  };
  # extensions = with vscode-marketplace-release; [
  extensions = with pkgs.vscode-extensions; [
   ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
         "ms-python"."python" = vscode-utils.extensionFromVscodeMarketplace {
           name = "python";
           publisher = "ms-python";
           version = "2024.23.2025010801";
           sha256 = "1s535r6bsnrlg216cp59gdhzs1di2yw7nj2za91ckk3nva92v6h6";
           arch = "darwin-arm64";
         };
         "ms-python"."debugpy" = vscode-utils.extensionFromVscodeMarketplace {
           name = "debugpy";
           publisher = "ms-python";
           version = "2024.15.2024121701";
           sha256 = "12qlsfhhxn34gy3ypfh5mdpccz8xhv9jy94zxw4zp11rvddby9bf";
           arch = "darwin-arm64";
         };
         "ms-python"."debugpy" = vscode-utils.extensionFromVscodeMarketplace {
           name = "debugpy";
           publisher = "ms-python";
           version = "2024.15.2024121701";
           sha256 = "11mgcsx136scanrp64aym2lqyfwj4d3cmr74ichcm62s6lk6c4q6";
           arch = "darwin-arm64";
         };
         "redhat"."java" = vscode-utils.extensionFromVscodeMarketplace {
           name = "java";
           publisher = "redhat";
           version = "1.39.2025010808";
           sha256 = "05waqha5z110c4fb5sbgr2wv0w7a4qg7ahay97la16l1li1x6322";
           arch = "darwin-arm64";
         };
         "redhat"."java" = vscode-utils.extensionFromVscodeMarketplace {
           name = "java";
           publisher = "redhat";
           version = "1.39.2025010808";
           sha256 = "19hz862jkyainm4qk3zcf5h46swq5cgq8f2diw47nxhqj5bilsz5";
           arch = "darwin-arm64";
         };
         "redhat"."vscode-xml" = vscode-utils.extensionFromVscodeMarketplace {
           name = "vscode-xml";
           publisher = "redhat";
           version = "0.27.2024121308";
           sha256 = "1hrhzjqysrl9fw5xn6dgfiz8ksmy45grq0h92d7ml6z1hhcfdilb";
           arch = "darwin-arm64";
         };
         "redhat"."vscode-xml" = vscode-utils.extensionFromVscodeMarketplace {
           name = "vscode-xml";
           publisher = "redhat";
           version = "0.27.2024121308";
           sha256 = "0wwfi44b7fmag4yy2g8g3m712any8yrw261rq0fg6niipx8p21is";
           arch = "darwin-arm64";
         };
         "devsense"."phptools-vscode" = vscode-utils.extensionFromVscodeMarketplace {
           name = "phptools-vscode";
           publisher = "devsense";
           version = "1.54.16642";
           sha256 = "0699vgrjk2qa1c39x1vx2g6vnjpgibnzh2pxligrf18h3ph818qr";
           arch = "darwin-arm64";
         };
         "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
           name = "rust-analyzer";
           publisher = "rust-lang";
           version = "0.4.2256";
           sha256 = "147arpcgyypjn7972h7368bbni19mdz9f02dmyqaxk25viwc6clg";
           arch = "darwin-arm64";
         };
       })
  ];
}
