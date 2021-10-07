{ pkgs, homePath }:
pkgs.stdenv.mkDerivation {
  name = "idris2libs";
  src = fetchTarball {
    url = "https://github.com/idris-lang/Idris2/archive/main.tar.gz";
    sha256 = "0d48hgbanqkfgjavac9pgq55zwds72n9ibhyl4j4ll97pkdwwn4x";
  };
  dontConfigure = true;
  dontBuild = true;
  buildInputs = [ pkgs.idris2 ];
  installPhase = ''
    export IDRIS2_PREFIX=${homePath}/.idris
    idris2 --install libs/base/base.ipkg
    idris2 --install libs/network/network.ipkg
    idris2 --install libs/prelude/prelude.ipkg
    idris2 --install libs/contrib/contrib.ipkg
    make src/IdrisPaths.idr
    idris2 --install idris2api.ipkg
    mkdir -p $out
  '';
}
