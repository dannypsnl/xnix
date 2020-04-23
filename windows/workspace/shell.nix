{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      # build system
      cmake
      gcc
      gnumake
      # c++ dev dependencies
      boost
      protobuf
      gtest
      grpc
      nlohmann_json
      curl
      cpp-netlib
      libnats-c
      howard-hinnant-date
      libmysqlclient
    ];
}
