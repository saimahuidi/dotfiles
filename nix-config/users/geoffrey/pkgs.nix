{
  lib,
  pkgs,
  ...
}: {

  imports = [
  ];

  home.packages = with pkgs; [
    # utils
    btop
    neovim

    # compiler
    cargo
    nodejs

    #gui
    alacritty
    firefox
  ];

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
