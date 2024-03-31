{
  pkgs,
  inputs,
  ...
}: {

  imports = [
    ../configs/alacritty.nix
  ];

  home.packages = with pkgs; [
    #gui
    alacritty
    firefox
    logseq
    qq
    wpsoffice
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

}
