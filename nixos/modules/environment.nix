{ pkgs, pkgs-unstable, ... }:

let
  unstable = pkgs-unstable;
in
{
  environment = {
    variables = {
      EDITOR = "nvim";
    };

    systemPackages = with pkgs; [
      adwaita-icon-theme
      adw-gtk3
      android-tools
      asciinema
      bash-language-server
      bat
      binutils
      black
      btop
      btop-rocm
      bubblewrap
      cargo
      cava
      clang
      clang-tools
      cmatrix
      cowsay
      distrobox
      docker
      dotnet-sdk_10
      easyeffects
      emmet-language-server
      evince
      eza
      fastfetch
      fd
      ffmpeg
      figlet
      foot
      fortune
      fzf
      gcc
      git
      gnome-calculator
      gnumake
      go
      gpu-screen-recorder
      gzip
      hyprpicker
      imagemagick
      imv
      keepassxc
      keychain
      lazygit
      lua-language-server
      man-pages
      man-pages-posix
      mesa
      mpv
      ncdu
      neovim
      nil
      nodejs_26
      opencode
      pandoc
      pavucontrol
      pciutils
      pipes
      pkg-config
      poppler-utils
      powertop
      prettierd
      prettypst
      proton-vpn
      pyright
      qbittorrent
      qemu
      ripgrep
      rust-analyzer
      rustc
      starship
      stow
      stylua
      supertux
      tinymist
      tldr
      tree-sitter
      tty-solitaire
      typst
      unrar
      unstable.brave-origin
      unstable.noctalia
      unstable.noctalia-greeter
      unstable.wezterm
      unzip
      usbutils
      vim
      vscode-langservers-extracted
      wev
      wget
      wl-clipboard
      wl-mirror
      xdg-desktop-portal
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-user-dirs
      xdg-utils
      xwayland-satellite
      xz
      yaml-language-server
      yazi
      zip
      zoxide
    ];
  };

  documentation = {
    enable = true;
    dev.enable = true;
    man.enable = true;
  };
}
