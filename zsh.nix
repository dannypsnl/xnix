pkgs: isMacOS:
{
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "dotenv" "osx" ];
    theme = "robbyrussell";
  };

  plugins = [
    {
      name = "k";
      src = pkgs.fetchFromGitHub {
        owner = "supercrabtree";
        repo = "k";
        rev = "master";
        sha256 = "053dd945qfxzk50agapc9ph601611niz1yzjqfx6fjza3j6cjsnz";
      };
    }
  ];

  shellAliases = {
    g = "git";
    ls = "ls -GFh";
    ll = "ls -l";
    la = "ll -a";
    lm = "ll | more";
    lam = "la | more";
    vi = "nvim";
    vim = "nvim";
  };

  initExtraFirst =
  if isMacOS then ''
  source $HOME/.macos-extra
  '' else "";
}
