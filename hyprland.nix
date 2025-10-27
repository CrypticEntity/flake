{ config, pkgs, ... }:

{
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = with pkgs; [
    # ... other packages
    kitty # required for the default Hyprland config
    waybar
    dunst
    libnotify
  ];

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
