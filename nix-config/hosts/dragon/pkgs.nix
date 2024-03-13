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
    vim

    #network
    git
    wget
    curl

    # compiler
    gcc
  ];
}
