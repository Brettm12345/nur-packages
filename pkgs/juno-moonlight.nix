{ stdenv, gtk-engine-murrine }:
let sources = import ../nix/sources.nix;
in stdenv.mkDerivation rec {
  name = "juno-moonlight-${version}";
  version = "1.0.0";
  src = sources.juno;
  propagatedUserEnvPkgs = [ gtk-engine-murrine ];
  sourceRoot = ".";
  installPhase = ''
    mkdir -p $out/share/themes/Juno
    cp -a ./source/* $out/share/themes/Juno
  '';
}
