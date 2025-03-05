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
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    chiaki
    dust
    eza
    fastfetch
    fish
    gamescope
    gh
    git
    htop
    hunspell
    hunspellDicts.en_AU
    libreoffice-qt-fresh
    librespot
    moonlight-qt
    nerd-fonts.jetbrains-mono
    nil
    openmw
    pkgs.nixfmt-rfc-style
    prismlauncher
    python314
    qbittorrent
    spotifyd
    spotify-qt
    starship
    vlc
    vim
    warzone2100
    wget
    yt-dlp
  ];

  nixpkgs.overlays =
  let
    # Change this to a rev sha to pin
    moz-rev = "master";
    moz-url = builtins.fetchTarball { url = "https://github.com/mozilla/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";};
    nightlyOverlay = (import "${moz-url}/firefox-overlay.nix");
  in [
    nightlyOverlay
  ];
  programs.firefox.package = pkgs.latest.firefox-nightly-bin;


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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  system.stateVersion = "22.05";
}
