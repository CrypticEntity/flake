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
    firefox
    #firefox-devedition
    kdePackages.filelight
    kdePackages.kdeconnect-kde
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kolourpaint
    kdePackages.merkuro
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
  ];

}
