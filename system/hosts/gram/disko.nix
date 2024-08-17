{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.default
  ];

  disko.devices.disk.primary = {
    type = "disk";
    device = "/dev/nvme0n1"; # FIXME: Replace this before install
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          priority = 1;
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        nixos-root = {
          priority = 2;
          end = "-256G";
          content = {
            type = "btrfs";
            extraArgs = ["-f"];
            subvolumes = {
              "@" = {
                mountpoint = "/";
              };
              "@home" = {
                mountOptions = ["compress=zstd"];
                mountpoint = "/home";
              };
              "@nix" = {
                mountOptions = ["compress=zstd" "noatime"];
                mountpoint = "/nix";
              };
              "@swap" = {
                mountpoint = "/swap";
                swap.swapfile.size = "8G";
              };
            };
          };
        };
        windows-msr = {
          priority = 3;
          size = "16M";
          type = "0C01";
          content = {
            type = "filesystem";
            format = "vfat";
          };
        };
        windows-root = {
          priority = 4;
          size = "100%";
          type = "0700";
          content = {
            type = "filesystem";
            format = "ntfs";
            extraArgs = ["-Q"];
          };
        };
      };
    };
  };
}
