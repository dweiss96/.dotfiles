userName: userEmail: {
  enable = true;
  userName = userName;
  userEmail = userEmail;
  lfs.enable = true;
  delta = {
    enable = true;
    options = {
      navigate = true;    # use n and N to move between diff sections
          light = false;      # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
          side-by-side = true;
    };
  };
  extraConfig = {
    pull = {
      ff = "only";
    };
    rebase = {
      autoSquash = true;
      autoStash = true;
      missingCommitsCheck = "error";
    };
    init = {
      defaultBranch = "main";
    };
    rerere = {
      enabled = true;
    };
    core = {
      editor = "vim";
      # excludesFile = "~/.config/git/ignore";
      # pager = delta;
    };

    # delta = {
    # navigate = true;    # use n and N to move between diff sections
    #     light = false;      # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
    #     side-by-side = true;
    # };

    # [filter "lfs"]
    "filter \"lfs\"" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = "true";
    };
  };
  aliases = {
    unstage = "reset HEAD --";
    l = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --date=short";
    f = "fetch -a -p";

    rmsoft = "rm --cached";

    rs = "reset --soft";
    rh = "reset --hard";
    rhod = "reset --hard origin/develop";
    rsod = "reset --soft origin/develop";
    rhom = "reset --hard origin/master";
    rsom = "reset --soft origin/master";

    rb = "rebase";
    rbi = "rebase -i";
    rbc = "rebase --continue";
    rba = "rebase --abort";
    rbfix = "!GIT_EDITOR=true git rebase -i";

    a = "add";
    aa = "add .";
    ap = "add -p";

    c = "commit --verbose";
    cm = "commit -m";
    cl = "clone";
    cf = "commit --fixup";

    ca = "commit --amend --verbose";
    cane = "commit --amend --no-edit";

    cp = "cherry-pick";

    d = "diff";
    wd = "diff --word-diff";
    ds = "diff --stat";
    dc = "diff --cached";
    dtm = "diff HEAD master";
    dlc = "diff HEAD~1 HEAD";

    delete = "!f() { REFNAME=$1; BRANCH=$2; REMOTE=$3; if [ $REFNAME = $BRANCH ]; then git branch -D $BRANCH ; else git push --delete $REMOTE $BRANCH ; fi }; f";
    s = "status -s";

    rco = "!f() { REGEX=$1; shift; git checkout \"$@\" \"$(git branch --all | cut -c 3- | sed 's|^remotes/.*/||' | grep -m 1 -iEe \"$REGEX\" )\"; }; f";
    co = "checkout";
    cob = "checkout -b";

    # list branches sorted by last modified
    bs = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'";

    # list aliases
    la = "!git config -l | grep alias | cut -c 7-";

    b = "branch";

    p = "push";
    pf = "push --force-with-lease";
    pnv = "push --no-verify";
    pfnv = "push --no-verify --force-with-lease";

    bd = "branch -d";
    bD = "branch -D";
    brd = "push --delete --no-verify origin";

    daily = "reflog --since=\"30 hours ago\" --author=dweiss --pretty=\"format:%Cblue%ci %Creset%s\"";
  };
  ignores = [
    ".metals"
    ".bloop"
    ".scalafmt.conf"
    "2019.*"
    "2020.*"
    ".ensime"
    ".ensime_cache"
    ".sbt"
    ".history"
    ".yarn"
    ".yarnrc"
    ".yarnrc.yml"
    ".yarn.rc"
    "project/metals.sbt"
    "rustVersion/target"
    "pc.stdout.log"
    "ensime-langserver.log"
    ".vscode"
    ".idea"
    ".DS_Store"

    # my custom test directories
    "tmp"
    "temp"
    "gitignored"

    # msal files android
    "app/src/main/res/raw/msal_config_prod.json"
    "app/src/main/res/raw/msal_config_stage.json"

    # nix shell file for now
    "shell.nix"

  ];
}
