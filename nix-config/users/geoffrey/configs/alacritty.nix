{
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;

    settings = {
      fonts.normal = { family = "FiraCode Nerd Font"; };
    };
  };
}
