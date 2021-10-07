{ pkgs, lib, isNixOS }: {
  enable = isNixOS;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions;
    [ WakaTime.vscode-wakatime ]
    ++ lib.optionals isNixOS [ bbenoist.Nix ms-vsliveshare.vsliveshare ];
  userSettings = {
    "workbench.colorTheme" = "Visual Studio Light";
    "editor.fontSize" = 13;
    "editor.defaultFormatter" = "JakeBecker.elixir-ls";
    "editor.formatOnSave" = true;
    "editor.fontFamily" = "'PragmataPro Mono Liga'";
  };
}
