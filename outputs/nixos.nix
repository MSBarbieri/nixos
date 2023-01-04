{inputs, ...}:
with inputs; let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  defaultModules = [
    home-manager.nixosModules.home-manager
    ../common/fonts.nix
    ../common/nix_conf.nix
    ({
      config,
      lib,
      lib',
      ...
    }: {
      config = {
        _module.args = {
          lib' = lib // import ../lib {inherit config lib;};
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.matheus-barbieri.imports = [../home/default.nix];
        };
      };
    })
    ({
      config,
      pkgs,
      lib,
      ...
    }: {
      environment.systemPackages =
        (import ../packages/langs.nix {inherit pkgs;})
        ++ (import ../packages/common.nix {inherit pkgs;})
        ++ (import ../packages/nix.nix {inherit pkgs;})
        ++ (import ../packages/desktop.nix {inherit pkgs;})
        ++ (import ../packages/virtualization.nix {inherit pkgs;});
    })
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
  home-desktop = nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        ../machines/home-desktop
      ]
      ++ defaultModules
      ++ desktopLinuxModules;
    specialArgs = {inherit inputs;};
  };
}
