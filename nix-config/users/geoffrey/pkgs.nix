{
  pkgs,
  inputs,
  ...
}: {

  imports = [
    ./configs/alacritty.nix
    ./configs/git.nix
    ./configs/neovim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      inputs.neovim-nightly-overlay.overlay
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    # utils
    btop
    micromamba
    eza

    # compiler
    cargo
    nodejs

    #gui
    alacritty
    firefox
    logseq
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

}
