{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    userName = "geoffrey";
    userEmail = "geoffrey2gong@gmail.com";
  };
}
