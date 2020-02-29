{ config, lib, ... }:
with lib;
let
  cfg = config.home.shell;
  sessionVariables = cfg.env // import ./env.nix;
  defaultAliases = import ./aliases.nix;
  shellFunctions = lib.concatStringsSep "\n" (lib.mapAttrsToList (fn: body: ''
    function ${fn}() {
      ${body}
    }
  '') cfg.functions);
in {
  options.home.shell = {
    functions = mkOption {
      type = types.attrsOf types.lines;
      default = { };
    };
    env = mkOption {
      type = with types; attrsOf (either str (listOf str));
      apply = mapAttrs (n: v: if isList v then concatStringsSep ":" v else v);
    };
    aliases = mkOption {
      type = types.attrsOf types.str;
      default = defaultAliases;
      apply = a: a // defaultAliases;
    };
  };
  options.programs.bash.localVariables = mkOption {
    type = types.attrsOf types.str;
    default = { };
  };

  config.programs.fish = mkIf config.programs.fish.enable {
    shellAliases = cfg.aliases;
    shellInit = lib.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: ''set -x ${k} "${v}"'') sessionVariables);
  };

  config.programs.zsh = mkIf config.programs.zsh.enable {
    inherit sessionVariables;
    shellAliases = cfg.aliases;
    initExtra = shellFunctions;
  };
  config.programs.bash = mkIf config.programs.bash.enable {
    inherit sessionVariables;
    shellAliases = cfg.aliases;
    initExtra = ''
      ${config.lib.zsh.defineAll config.programs.bash.localVariables}
      ${shellFunctions}
    '';
  };
}
