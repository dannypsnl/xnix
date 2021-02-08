machine:
{
  enable = true;
  userName = "Lîm Tsú-thuàn";
  userEmail = "dannypsnl@gmail.com";
  aliases = {
    co = "checkout";
    cm = "commit";
    br = "branch";
    mg = "merge";
    df = "diff";
    st = "status";
    ad = "add";
    rb = "rebase";
    tree = "log --graph --decorate --pretty=oneline --abbrev-commit";
  };
  ignores = [
    "*~" "*.swp" "*.o" "*.a" "*.so" "*.aux" "*.dylib"
    # editor/IDE
    ".idea/" ".vscode/"
    ".ccls-cache/"
  ];
  extraConfig = {
    init.defaultBranch = "develop";
    core.editor = "nvim";
    color.ui = true;
    branch.autosetuprebase = "always";
    push.default = "current";
    rebase.autosquash = true;
    commit.template = machine.xnixPath + "/commit-template.txt";
  };
}
