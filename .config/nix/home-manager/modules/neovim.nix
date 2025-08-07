{
  pkgs,
  unstable,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = unstable.neovim-unwrapped;
    extraPackages = with pkgs; [
      # Tools
      nodejs_24
      cargo

      # Language servers
      nil
      lua-language-server
      zls
      phpactor
      vtsls
      tailwindcss-language-server
      vscode-langservers-extracted # css, eslint, html, json, md
      emmet-language-server
      gopls

      # Formatters/linters
      alejandra
      prettierd
      eslint_d
    ];
  };
}
