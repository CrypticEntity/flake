# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{

  imports =  [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./apple-silicon-support
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  hardware.bluetooth.enable = true; # Enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # Powers up the default Bluetooth controller on boot
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3e763fca-4776-4bda-9007-1619bcb72379";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/usr/lib/firmware/vendor" =
    { device = "vendorfw";
      fsType = "tmpfs";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/3e763fca-4776-4bda-9007-1619bcb72379";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FEDF-195A";
      fsType = "vfat";
    };

 swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];
  networking.useDHCP = lib.mkDefault true;
  nix.settings.max-jobs = 3;
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  powerManagement.enable = true;

  hardware.asahi = {
    useExperimentalGPUDriver = true;
  };

  boot.kernelParams = [
    "apple_dcp.show_notch=1" "hid_apple" "fnmode=2"
  ];
}