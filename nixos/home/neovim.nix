{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      typescript-language-server
      tailwindcss-language-server
      vscode-langservers-extracted
      emmet-language-server
      clang-tools
      nil
      basedpyright
      vscode-css-languageserver
      hyprls
      stylua
      ruff
      prettierd
      eslint_d
      nixfmt
      bash-language-server
      shfmt
    ];
  };
}
