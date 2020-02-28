{ stdenv, lib, pkgconfig, asciidoc, docbook_xml_dtd_45, docbook_xsl, libxslt
, libxml2, makeWrapper, meson, ninja, xorg, libxcb, xcbutilrenderutil
, xcbutilimage, pixman, libev, dbus, libconfig, libdrm, libGL, pcre, libX11
, libXinerama, libXext, xwininfo, libxdg_basedir, xorgproto ? xorg.xproto
, uthash }:

let
  sources = import ../nix/sources.nix;
  common = source:
    stdenv.mkDerivation (source // rec {
      name = "${source.pname}-${source.version}";

      nativeBuildInputs = (source.nativeBuildInputs or [ ])
        ++ [ pkgconfig asciidoc docbook_xml_dtd_45 docbook_xsl makeWrapper ];

      installFlags = [ "PREFIX=$(out)" ];

      postInstall = ''
        wrapProgram $out/bin/compton-trans \
          --prefix PATH : ${lib.makeBinPath [ xwininfo ]}
      '';

      meta = with lib; {
        description = "A fork of picom with a rounded corners patch";
        longDescription = ''
          Adds the `--corner-radius RADIUS` option to `picom`.
        '';
        license = licenses.mit;
        maintainers = with maintainers; [ ertes enzime twey ];
        platforms = platforms.linux;
      };
    });

  gitSource = rec {
    pname = "picom-rounded-corners";
    version = "5.1";

    COMPTON_VERSION = "v${version}";

    nativeBuildInputs = [ meson ninja ];

    src = sources.compton;

    buildInputs = [
      dbus
      libX11
      libXext
      xorgproto
      libXinerama
      libdrm
      pcre
      libxml2
      libxslt
      libconfig
      libGL
      libxcb
      xcbutilrenderutil
      xcbutilimage
      pixman
      libev
      libxdg_basedir
      uthash
    ];

    preBuild = ''
      git() { echo "v${version}"; }
      export -f git
    '';

    NIX_CFLAGS_COMPILE = [ "-fno-strict-aliasing" ];

    mesonFlags =
      [ "-Dvsync_drm=true" "-Dnew_backends=true" "-Dbuild_docs=true" ];
  };
in common gitSource
