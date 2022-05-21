{ pkgs, isNixOS }:
pkgs.stdenv.mkDerivation {
  name = "zig";
  src = if isNixOS then
    fetchTarball {
      url = "https://ziglang.org/download/0.9.0/zig-linux-x86_64-0.9.0.tar.xz";
      sha256 = "5c55344a877d557fb1b28939785474eb7f4f2f327aab55293998f501f7869fa6";
    }
  else
    fetchTarball {
      url = "https://ziglang.org/builds/zig-macos-aarch64-0.10.0-dev.2340+1a92264b3.tar.xz";
      sha256 = "sha256:1q73h584v5mqgj6si24mmk656ilj9mamnq2r2hydp8miyfszln7p";
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
