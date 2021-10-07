{ pkgs, lib, isNixOS }: {
  enable = isNixOS;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions;
    [ WakaTime.vscode-wakatime esbenp.prettier-vscode ]
    ++ lib.optionals isNixOS [ bbenoist.Nix ms-vsliveshare.vsliveshare ];
  userSettings = {
    "workbench.colorTheme" = "Visual Studio Light";
    "editor.fontSize" = 13;
    "editor.formatOnSave" = true;
    "editor.fontFamily" = "'PragmataPro Mono Liga'";
    "[elixir].editor.defaultFormatter" = "JakeBecker.elixir-ls";
    "[javascript].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[javascriptreact].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[typescript].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[typescriptreact].editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
}
