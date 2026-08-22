{ pkgs, ... }: {
  home.packages = with pkgs; [
    # LSPs
    lua-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    emmet-language-server
    clang-tools
    basedpyright
    nil

    # Formatters & Linters
    stylua
    ruff
    prettierd
    eslint_d
    nixfmt
    bash-language-server
    shfmt
    kdlfmt
  ];
}
