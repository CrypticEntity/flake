{ inputs, config, pkgs, ... }:

{


  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = with pkgs; [
    inputs.caelestia-cli.packages.aarch64-linux.default
    inputs.caelestia-shell.packages.aarch64-linux.default
    inputs.zen-browser.packages.aarch64-linux.default
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    hyprpicker
    wl-clipboard
    cliphist
    inotify-tools
    app2unit
    wireplumber
    trash-cli
    foot
    btop
    jq
    eza
    adw-gtk3
    papirus-icon-theme
    libsForQt5.qt5ct
    kdePackages.qt6ct
    xfce.thunar
  ];
  
  programs.thunar.plugins = with pkgs.xfce; [
     thunar-archive-plugin
     thunar-volman
  ];

}
