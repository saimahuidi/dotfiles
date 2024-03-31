{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;

    package = pkgs.neovim-nightly;

    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    viAlias = true;
    vimAlias = true;
  };
}
