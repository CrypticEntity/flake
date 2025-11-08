{ inputs, config, pkgs, ... }:

{

  programs.hyprland.enable = true; # enable Hyprland
  services.geoclue2.enable = true;  # For QtPositioning
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
     firefox
     rubik
     nerd-fonts.ubuntu
     nerd-fonts.jetbrains-mono
     kdePackages.qtstyleplugin-kvantum
     qalculate-gtk
     kdePackages.dolphin
     kdePackages.ark
     gsettings-desktop-schemas
     python313Packages.kde-material-you-colors
  ];
  environment.variables = {
     #QT_STYLE_OVERRIDE = null;
  };  
   services.greetd = {
     enable = true;
     settings = rec {
       initial_session = {
         command = "Hyprland";
         user = "end4dots";
       };
       default_session = initial_session;
     };
   };

}
