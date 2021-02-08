{
  enable = true;
  extraPackages = epkgs:
    with epkgs; [
      use-package
      nix-mode
      agda2-mode
      idris-mode
      racket-mode
      magit
    ];
}
