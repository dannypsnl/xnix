{ pkgs, lib, isNixOS }:
let
  extraExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "agda-mode";
      publisher = "banacorn";
      version = "0.3.2";
      sha256 = "0ailiq2ib3cv69ikvsa2kjwk0p69vfsgrvwx5mvcagyhnsnxdhbv";
    }
    {
      name = "elixir-ls";
      publisher = "JakeBecker";
      version = "0.8.1";
      sha256 = "18ky671zs4a4lj2bdnwngfh4qf0pcvd3skywq0w49isa93ymypig";
    }
    {
      name = "Nix";
      publisher = "bbenoist";
      version = "1.0.1";
      sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
    }
    {
      name = "nixfmt-vscode";
      publisher = "brettm12345";
      version = "0.0.1";
      sha256 = "07w35c69vk1l6vipnq3qfack36qcszqxn8j3v332bl0w6m02aa7k";
    }
    {
      name = "vsliveshare";
      publisher = "MS-vsliveshare";
      version = "1.0.5090";
      sha256 = "sha256-gQ4tChmGxYIt+/izw9NvLCLHD8ypNO7pcWuLw4umhF0=";
    }
    {
      name = "vsliveshare-pack";
      publisher = "MS-vsliveshare";
      version = "0.4.0";
      sha256 = "09h2yxpmbvxa3mz5wdnpb35h437f0z6j0n3blsb0d93jlwx5ydy5";
    }
    {
      name = "vsliveshare-audio";
      publisher = "MS-vsliveshare";
      version = "0.1.91";
      sha256 = "0p00bgn2wmzy9c615h3l3is6yf5cka84il5331z0rkfv2lzh6r7n";
    }
    {
      name = "remote-ssh";
      publisher = "ms-vscode-remote";
      version = "0.66.1";
      sha256 = "sha256-+v4UnGRG5xOc8k0IzvHUBHa128fhgd3jcmEuciiMQmI=";
    }
    {
      name = "change-case";
      publisher = "wmaurer";
      version = "1.0.0";
      sha256 = "0dxsdahyivx1ghxs6l9b93filfm8vl5q2sa4g21fiklgdnaf7pxl";
    }
    {
      name = "magic-racket";
      publisher = "evzen-wybitul";
      version = "0.5.8";
      sha256 = "0wfpimaanj6mh9qqip09rb2jzv7jscf9fzkp7l3885nwkx4xfqca";
    }
    {
      name = "language-julia";
      publisher = "julialang";
      version = "1.5.6";
      sha256 = "sha256-gThEwb7Ng9tT9JlHHJ2zbTYQkCpubjfhJ853mPchNYk=";
    }
    {
      name = "idris-vscode";
      publisher = "meraymond";
      version = "0.0.10";
      sha256 = "15sq8g16bxmw6wzacz757nkkpqr03gsxxj4ig3fpr8blzf6v2bd0";
    }
    {
      name = "idris2-lsp";
      publisher = "bamboo";
      version = "0.7.0";
      sha256 = "0i9my3iqy62ziank4mr5j5adgbv8g7x3jcscwwg8h1hgllffzqpi";
    }
    {
      name = "Go";
      publisher = "golang";
      version = "0.28.1";
      sha256 = "sha256-/4Et77sYjCuWZSdMWjIDBNC2TH/h2ndmbz8So3VjPro=";
    }
    {
      name = "rust";
      publisher = "rust-lang";
      version = "0.7.8";
      sha256 = "sha256-Y33agSNMVmaVCQdYd5mzwjiK5JTZTtzTkmSGTQrSNg0=";
    }
    {
      name = "svelte-vscode";
      publisher = "svelte";
      version = "105.4.2";
      sha256 = "sha256-y10K529uMSwscwtOXFe5el0IcCNzdwv0NOyS6UNkmuk=";
    }
  ];
in {
  enable = true;
  package = pkgs.vscode;
  extensions = with pkgs.vscode-extensions;
    [ WakaTime.vscode-wakatime esbenp.prettier-vscode ] ++ extraExtensions;
  userSettings = {
    "workbench.colorTheme" = "Visual Studio Light";
    "editor.formatOnSave" = true;
    "editor.guides.bracketPairs" = true;
    # font
    "editor.fontSize" = 13;
    "editor.fontFamily" = "'PragmataPro Mono Liga'";
    # idris
    "idris.idris2Mode" = true;
    "idris.idrisPath" = "idris2";
    # git
    "git.confirmSync" = false;
    "git.enableSmartCommit" = true;
    # formatter
    "[elixir]" = { "editor.defaultFormatter" = "JakeBecker.elixir-ls"; };
    "[javascript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
    "[javascriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[typescript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
    "[typescriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
  };
}
