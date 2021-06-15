pkgs:
  (pkgs.stdenv.mkDerivation {
        name = "zig";
        src = fetchTarball {
            url = "https://ziglang.org/download/0.8.0/zig-macos-aarch64-0.8.0.tar.xz";
            sha256 = "1q1wjaqikjg51cmfzw9f6afkkj7ay9w3h8ninayk8k54d889vv3v";
        };
        dontConfigure = true;
        dontBuild = true;
        installPhase = ''
        mkdir -p $out
        mv ./lib $out/
        mkdir -p $out/bin
        mv ./zig $out/bin
        mkdir -p $out/doc
        #mv ./langref.html $out/doc
        '';
  })
