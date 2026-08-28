{ config, ... }:
let
  dotconfig = "${config.home.homeDirectory}/.dotfiles/config";
  dothome = "${config.home.homeDirectory}/.dotfiles/hidden";
  create_symLink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop = "btop";
    eza = "eza";
    fastfetch = "fastfetch";
    foot = "foot";
    "gtk-2.0" = "gtk-2.0";
    "gtk-3.0" = "gtk-3.0";
    "gtk-4.0" = "gtk-4.0";
    lazygit = "lazygit";
    niri = "niri";
    noctalia = "noctalia";
    nvim = "nvim";
    qt5ct = "qt5ct";
    qt6ct = "qt6ct";
    "starship.toml" = "starship.toml";
    vim = "vim";
    wezterm = "wezterm";
    yazi = "yazi";
  };
  home_files = {
    ".bash_aliases" = "bash_aliases";
    ".bash_git" = "bash_git";
    ".bash_integration" = "bash_integration";
    ".bashrc" = "bashrc";
    ".clang-format" = "clang-format";
    ".gitconfig" = "gitconfig";
    ".gtkrc-2.0" = "gtkrc-2.0";
    ".inputrc" = "inputrc";
    ".prettierrc" = "prettierrc";
    ".vimrc" = "vimrc";
  };
in
{
  home.username = "moucheh";
  home.homeDirectory = "/home/moucheh";
  home.stateVersion = "26.05";
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symLink "${dotconfig}/${subpath}";
    recursive = true;
  }) configs;
  home.file = builtins.mapAttrs (name: subpath: {
    source = create_symLink "${dothome}/${subpath}";
    recursive = false;
  }) home_files;
}
