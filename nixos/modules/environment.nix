{
  pkgs,
  pkgs-unstable,
  pinnedBtop,
  ...
}:

let
  unstable = pkgs-unstable;

  patchedBtop = pinnedBtop.btop-rocm.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ./patches/btop-normalize-processes.patch
    ];
  });
in
{
  nixpkgs.overlays = [
    (final: prev: {
      qutebrowser = prev.qutebrowser.override {
        enableWideVine = true;
      };

      btop-rocm = patchedBtop;
    })
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
      TERMINAL = "footclient";
    };
    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
      JAVA_HOME = "${pkgs.jdk25}/lib/openjdk";
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
      brave-origin
      btop-rocm
      bubblewrap
      cargo
      cava
      clang
      clang-tools
      cmatrix
      cowsay
      delta
      distrobox
      dnsmasq
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
      jdk25
      jq
      keepassxc
      keychain
      lazygit
      libnotify
      lua-language-server
      man-pages
      man-pages-posix
      maven
      mesa
      (mpv.override { scripts = [ mpvScripts.mpris ]; })
      ncdu
      neovim
      nil
      nodejs_26
      nushell
      onlyoffice-desktopeditors
      pandoc
      pavucontrol
      pciutils
      pdfarranger
      pipes
      pkg-config
      playerctl
      poppler-utils
      powertop
      prettierd
      prettypst
      proton-vpn
      pyright
      python314
      qbittorrent
      qemu
      qutebrowser
      ripgrep
      rust-analyzer
      rustc
      snapshot
      starship
      stow
      stylua
      supertux
      tinymist
      tldr
      tmux
      tree-sitter
      tty-solitaire
      typst
      unrar
      unstable.fetch
      unstable.noctalia
      unstable.noctalia-greeter
      unstable.opencode
      unstable.wezterm
      unzip
      usbutils
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
      yt-dlp
      ytfzf
      ytsub
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
