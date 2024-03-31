{
  pkgs,
  ...
}: {

  environment.systemPackages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    htop
    zsh
    tmux
    neovim
    home-manager

    #network
    git
    wget
    curl

    # compiler
    gcc
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];
}
