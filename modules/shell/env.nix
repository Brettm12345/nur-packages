{ ... }: rec {
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_CACHE_HOME = "$HOME/var/cache";
  XDG_DATA_HOME = "$HOME/usr/share";
  GOPATH = "$HOME";
  CARGO_HOME = "${XDG_DATA_HOME}/cargo";
  CASK_HOME = "$HOME/.cask";
  EMACS_HOME = "$HOME/.emacs.d";
  CABAL_HOME = "$HOME/.cabal";
  PROJECTS = "$HOME/src/github.com";
  GITHUB_USERNAME = "brettm12345";
  WORK_ORG = "the-mmm-agency";
  PERSONAL = "${PROJECTS}/${GITHUB_USERNAME}";
  WORK = "${PROJECTS}/${WORK_ORG}";
  CONFIG = "${PERSONAL}/nixos-config";
  PATH = [
    "$PATH"
    "${CASK_HOME}"
    "${CARGO_HOME}/bin"
    "${EMACS_HOME}/bin"
    "${CABAL_HOME}/bin"
    "$HOME/.local/bin"
  ];
}
