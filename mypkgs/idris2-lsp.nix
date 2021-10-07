{ pkgs, idris2libs, homePath }:
pkgs.stdenv.mkDerivation {
  name = "idris2-lsp";
  src = fetchTarball {
    url = "https://github.com/idris-community/idris2-lsp/archive/main.tar.gz";
    sha256 = "1dg2z9gn6vl12kj72jr92n48nqmbcl5mb1x6xn6zdhzmf5l7m6hw";
  };
  dontConfigure = true;
  dontBuild = true;
  buildInputs = [ pkgs.idris2 idris2libs ];
  installPhase = ''
    export IDRIS2_PREFIX=${homePath}/.idris
    mkdir -p $out/bin
    mkdir -p $out/lib
    idris2 --build lsp.ipkg
    mv ./build/exec/* $out/bin
  '';
}
