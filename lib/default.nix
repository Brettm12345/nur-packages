{ pkgs }:

with pkgs.lib; {
  afterLinkGen = data: {
    after = [ "linkGeneration" ];
    before = [ ];
    inherit data;
  };
}
