{
  inputs,
  user,
  session,
  desktop,
  ...
}:
with inputs; let

  nixpkgs.overlays = [fenix.overlays.default];
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  defaultModules = [
    home-manager.nixosModules.home-manager
    ../common/fonts.nix
    ../common/nix_conf.nix
    ../common/home_manager.nix
    ../common/packages.nix
  ];

  desktopLinuxModules = [
    ../common/linux.nix
    ../common/users.nix
    ../common/locale.nix
    ../common/networking.nix
    ../common/print.nix
    ../common/virtualization.nix
    ../common/sound.nix
    ../common/desktop.nix
    ../common/security.nix
  ];

  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
in {
  home-desktop = let
    machine = "home-desktop";
    system = "x86_64-linux";
  in
    nixosSystem {
      inherit system;
      modules =
        [
          ../machines/home-desktop
        ]
        ++ defaultModules
        ++ desktopLinuxModules;
      specialArgs = {inherit inputs;};
    };
}
