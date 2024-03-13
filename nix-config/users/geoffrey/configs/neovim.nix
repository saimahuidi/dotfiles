{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    viAlias = true;
    vimAlias = true;
  };
}
