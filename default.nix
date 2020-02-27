# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

with pkgs; {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays
  sources = import ./nix/sources.nix; # niv imports
  hmModules = import ./hm-modules;
  chromium = chromium.override {
    commandLineArgs = "--force-dark-mode --force-device-scale-factor=1.3";
  };
  juno-moonlight = callPackage ./pkgs/juno-moonlight.nix { };
  compton-rounded-corners = callPackage ./pkgs/compton-rounded-corners.nix { };
}
