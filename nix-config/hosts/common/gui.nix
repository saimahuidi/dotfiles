{
  pkgs,
  ... }: {

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    xkb.options = "ctrl:nocaps";
  };

  services.desktopManager.plasma6.enable = true;

}
