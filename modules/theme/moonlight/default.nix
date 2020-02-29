{ lib, pkgs, ... }:
with lib; {
  colors = transformColors (import ./colors.nix);
  fonts = import ./fonts.nix;
  icons = import ./icons.nix { inherit pkgs; };
}
