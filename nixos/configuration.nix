{
  lib,
  pkgs,
  ...
}:

let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth = {
      enable = true;
      theme = "spinner";
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };

  networking = {
    hostName = "t495";
    wireless.enable = true;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = lib.range 1714 1764;
      allowedUDPPorts = lib.range 1714 1764;
    };
  };

  time.timeZone = "Europe/Sarajevo";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  users.users."moucheh" = {
    isNormalUser = true;
    description = "moucheh";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

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
      black
      btop
      bubblewrap
      cargo
      cava
      clang
      clang-tools
      cmatrix
      cowsay
      distrobox
      docker
      dotnet-runtime_10
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
      go
      gpu-screen-recorder
      gzip
      hyprpicker
      imagemagick
      imv
      keepassxc
      keychain
      lazygit
      libxkbcommon
      lua-language-server
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
      ripgrep
      rust-analyzer
      rustc
      starship
      stow
      stylua
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

  programs = {
    kdeconnect.enable = true;
    niri.enable = true;
  };

  services = {
    auto-cpufreq.enable = true;

    acpid = {
      enable = true;
      handlers.lid-open = {
        event = "button/lid.*open";
        action = ''
          echo 0 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
        '';
      };
    };

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "/run/current-system/sw/bin/noctalia-greeter-session -- --session niri";
          user = "greeter";
        };
      };
    };

    gnome.gnome-keyring.enable = true;
    openssh.enable = true;
    fprintd.enable = true;
    upower.enable = true;
    flatpak.enable = true;
  };

  security = {
    polkit.enable = true;
    pam = {
      services = {
        greetd.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
        login.fprintAuth = false;
        greetd.fprintAuth = false;
        sudo.fprintAuth = true;
        polkit-1.fprintAuth = true;
      };
    };
  };

  systemd = {
    user.services.niri.enableDefaultPath = false;
    services.turn-off-thinkpad-led = {
      description = "Turn off ThinkPad power LED";

      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
      };

      script = ''
        echo 0 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
      '';
    };

  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu.opencl.enable = true;
  };
  system.stateVersion = "26.05";
}
