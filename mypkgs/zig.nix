{ pkgs, isNixOS }:
pkgs.stdenv.mkDerivation {
  name = "zig";
  src = if isNixOS then
    fetchTarball {
      url =
        "https://ziglang.org/builds/zig-linux-x86_64-0.9.0-dev.1324+598db831f.tar.xz";
      sha256 = "0vpi3cwcknav7mc7yyw52hv0lf00plpqsjv77d2pvfyj79jmsr0x";
    }
  else
    fetchTarball {
      url =
        "https://ziglang.org/builds/zig-macos-aarch64-0.9.0-dev.1324+598db831f.tar.xz";
      sha256 = "00qxfaagph4rx08351c0shfgcp382cs5q77932wwv1cp864v7yqq";
    };
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    mv ./lib $out/
    mkdir -p $out/bin  
    mv ./zig $out/bin
    mkdir -p $out/doc
  '';
}
