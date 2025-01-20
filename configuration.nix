{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
    #./nix-alien.nix
    ./plasma.nix
    #./hyprland.nix
  ];

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
    anki
    ani-cli
    android-tools
    apfsprogs
    chiaki
    dust
    eza
    fastfetch
    nerd-fonts.fira-code
    fish
    gh
    git
    htop
    hunspell
    hunspellDicts.en_AU
    libreoffice-qt-fresh
    librespot
    lime3ds
    moonlight-qt
    nil
    openmw
    pkgs.nixfmt-rfc-style
    prismlauncher
    python314
    spotifyd
    spotify-qt
    starship
    vlc
    vim
    wget
    yt-dlp
  ];

  services.openssh.enable = true;
  networking.networkmanager.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  system.stateVersion = "22.05";
}
