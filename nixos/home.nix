{ config, ... }:

let
  dotconfig = "${config.home.homeDirectory}/.dotfiles/config";
  dothome = "${config.home.homeDirectory}/.dotfiles/hidden";
  create_symLink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop = "btop";
    eza = "eza";
    fastfetch = "fastfetch";
    fetch = "fetch";
    foot = "foot";
    "gtk-2.0" = "gtk-2.0";
    "gtk-3.0" = "gtk-3.0";
    "gtk-4.0" = "gtk-4.0";
    lazygit = "lazygit";
    mpv = "mpv";
    niri = "niri";
    nix = "nix";
    nixpkgs = "nixpkgs";
    noctalia = "noctalia";
    nushell = "nushell";
    nvim = "nvim";
    qt5ct = "qt5ct";
    qt6ct = "qt6ct";
    qutebrowser = "qutebrowser";
    "starship.toml" = "starship.toml";
    vim = "vim";
    wezterm = "wezterm";
    yazi = "yazi";
    ytsub = "ytsub";
    ytm-player = "ytm-player";
  };
  home_files = {
    ".bash_profile" = "bash_profile";
    ".bashrc" = "bashrc";
    ".bashrc.d" = "bashrc.d";
    ".clang-format" = "clang-format";
    ".gitconfig" = "gitconfig";
    ".gtkrc-2.0" = "gtkrc-2.0";
    ".inputrc" = "inputrc";
    ".prettierrc" = "prettierrc";
    ".vimrc" = "vimrc";
    ".tmux.conf" = "tmux.conf";
  };
  mimeapps = {
    "application/pdf" = [ "org.gnome.Evince.desktop" ];
    "image/png" = [ "imv.desktop" ];
    "image/jpeg" = [ "imv.desktop" ];
    "image/jpg" = [ "imv.desktop" ];
    "image/webp" = [ "imv.desktop" ];
    "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
    "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
    "text/html" = [ "org.qutebrowser.qutebrowser.desktop" ];
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

  xdg.mimeApps = {
    enable = true;
    associations.added = mimeapps;
    defaultApplications = mimeapps;
  };
}
