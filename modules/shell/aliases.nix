{ pkgs, ... }:
with pkgs; {
  br = "${broot}/bin/broot -p";
  rg = "${ranger}/bin/ranger";
  nv = "${nvim}/bin/nvim";
  t = "${tmux}/bin/tmux";
  xr = "${xmonad}/bin/xmonad --rebuild";

  m = "man";
  o = "open-project";

  l = "${exa} --icons --git-ignore -1";
  ls = "${exa} --icons --git-ignore";
  ll = "${exa} --icons -l --git -h --git-ignore";
  la = "${exa} --icons -l --git -h -a -g";

  nb = "nix-build";
  ns = "nix-shell";
  nr = "nix repl <nixpkgs>";

  r = "exec $SHELL";
  re = "$CONFIG/install.sh";
}
