{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "kde";
    style = "kvantum";
  };


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.audiotube
    kdePackages.filelight
    kdePackages.falkon
    kdePackages.kdeconnect-kde
    kdePackages.ktorrent
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kolourpaint
    kdePackages.partitionmanager
    kdePackages.plasmatube
    libsForQt5.qtstyleplugin-kvantum
    kile
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    oxygen
    khelpcenter
    krdp
    xwaylandvideobridge
  ];

}