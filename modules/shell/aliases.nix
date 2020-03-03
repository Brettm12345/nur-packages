{ pkgs, ... }:
with pkgs; {
  br = "${broot}/bin/broot -p";
  rg = "${ranger}/bin/ranger";
  nv = "${nvim}/bin/nvim";
  t = "${tmux}/bin/tmux";
  xr = "${xmonad}/bin/xmonad --rebuild";
  p = "${xclip}/bin/xclip -selection clipboard -out";
  y = "${xclip}/bin/xclip -selection clipboard -in";
  m = "man";
  o = "open-project";
  l = "${exa}/bin/exa --icons --git-ignore -1";
  ls = "${exa}/bin/exa --icons --git-ignore";
  ll = "${exa}/bin/exa --icons -l --git -h --git-ignore";
  la = "${exa}/bin/exa --icons -l --git -h -a -g";
  na = "${niv}/bin/niv add";
  nb = "nix-build";
  no = "nix-opt";
  ns = "nix-shell";
  nr = "nix repl <nixpkgs>";
  nq = "nix-query";
  nsq = "nix-shell -p $(nix-query)";
  ni = "nix-env -iA $(nix-query)";
  r = "exec $SHELL";
  re = "$CONFIG/install.sh";
}
