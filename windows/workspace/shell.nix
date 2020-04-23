{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [
      pkgs.cmake
      pkgs.gcc
      pkgs.gnumake
      pkgs.boost
    ];
}
