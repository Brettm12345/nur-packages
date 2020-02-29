{ pkgs }:

with pkgs;
with lib; {
  afterLinkGen = data: {
    after = [ "linkGeneration" ];
    before = [ ];
    inherit data;
  };
  lighten = import ./lighten.nix { inherit pkgs; };
  hex2dec = import ./hex2dec.nix { inherit lib; };
  transformColors = import ./transformColors.nix { inherit lib; };
  pairWith = f: n: nameValuePair n (f n);
  mergeWith = f: l: listToAttrs (map (pairWith f) l);
}
