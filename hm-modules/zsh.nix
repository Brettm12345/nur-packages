{ ... }: {
  my.home.xdg.configFile."zsh" = {
    source = <config/zsh>;
    recursive = true;
  };
}
