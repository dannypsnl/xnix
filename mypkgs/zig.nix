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
      url = "https://ziglang.org/download/0.9.0/zig-macos-aarch64-0.9.0.tar.xz";
      sha256 = "sha256:0irr2b8nvj43d7f3vxnz0x70m8jlz71mv3756hx49p5d7ramdrp7";
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
