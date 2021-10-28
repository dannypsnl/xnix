pkgs: isMacOS: {
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "dotenv"
      "osx"
      "kubectl"
      "docker"
      "gradle"
      "mix"
      "npm"
      "vagrant"
      "heroku"
    ];
    theme = "robbyrussell";
  };

  plugins = [ ];

  shellAliases = {
    ls = "ls -GFh";
    ll = "ls -l";
    la = "ll -a";
    lm = "ll | more";
    lam = "la | more";
    vi = "nvim";
    vim = "nvim";
  };

  initExtra = "" + (if isMacOS then ''
    export IDRIS2_PREFIX=$HOME/.idris;
    source $HOME/.macos-extra
  '' else ''
    export IDRIS2_PREFIX=$HOME/.idris;
    source $HOME/.nixos-extra
  '');
}
