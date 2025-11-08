{ inputs, config, pkgs, ... }:

{


  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
    #./nix-alien.nix
    #./plasma.nix
    ./hyprland.nix
  ];

  networking.firewall.enable = false;

  # Define your hostname.
  networking.hostName = "nixos";

  # Set your time zone.
  time.timeZone = "Australia/Brisbane";

  # Select locales
  i18n.defaultLocale = "en_US.UTF-8";

  # Define your user
  users.users.cryptic = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # List packages installed in system profile.

  environment.systemPackages = with pkgs; [
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    anki
    ani-cli
    android-tools
    deskflow
    dust
    eza
    fastfetch
    filezilla
    fish
    fzf
    gh
    git
    htop
    hunspell
    libreoffice-qt-fresh
    librespot
    moonlight-qt
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nil
    nixfmt-rfc-style
    prismlauncher
    python314
    qbittorrent
    spotify-qt
    spotifyd
    starship
    unrar
    vlc
    vim
    wget
    yt-dlp
    (retroarch.withCores (cores: with cores; [
      desmume
      citra
      mgba
    ]))
  ];


  services.openssh.enable = true;
  networking.networkmanager.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  system.stateVersion = "22.05";
}
