{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nix-alien.nix
    ./plasma.nix
    #./hyprland.nix
  ];

  # Define your hostname.
  networking.hostName = "nixos";

  # Set your time zone.
  time.timeZone = "Australia/Brisbane";

  # Select locales.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define your user
  users.users.cryptic = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Define your user
  users.users.hypr = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    anki
    ani-cli
    android-tools
    apfsprogs
    box64
    chiaki
    dust
    eza
    fastfetch
    fish
    git
    htop
    hunspell
    hunspellDicts.en_AU
    libreoffice-qt-fresh
    librespot
    lime3ds
    moonlight-qt
    mpv
    nerd-fonts.fira-mono
    nil
    openmw
    pkgs.nixfmt-rfc-style
    prismlauncher
    python314
    spotifyd
    spotify-qt
    starship
    vim
    wget
    yt-dlp
  ];

  services.openssh.enable = true;
  networking.networkmanager.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.copySystemConfiguration = true;
  system.stateVersion = "22.05";
}
