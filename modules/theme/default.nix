{ config, pkgs, lib, ... }: {
  options.theme = import ./options.nix { inherit config lib pkgs; };
  config.theme = import ./moonlight { inherit lib pkgs; };
}
