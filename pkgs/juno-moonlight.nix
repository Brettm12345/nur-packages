{ stdenv, gtk-engine-murrine }:
let sources = import ../nix/sources.nix;
in stdenv.mkDerivation rec {
  name = "juno-moonlight-${version}";
  version = "1.0.0";
  src = sources.juno;
  homepage = "https://github.com/Brettm12345/Juno/tree/moonlight";
  description = ''
    A fork of the Juno GTK theme https://github.com/EliverLara/Juno
    with colors from the moonlight vscode theme
    https://github.com/atomiks/moonlight-vscode-theme
  '';
  propagatedUserEnvPkgs = [ gtk-engine-murrine ];
  sourceRoot = ".";
  installPhase = ''
    mkdir -p $out/share/themes/Juno
    cp -a ./source/* $out/share/themes/Juno
  '';
}
