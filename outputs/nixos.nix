{inputs, ...}:
with inputs; let
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

  user = {
    username = "matheus-barbieri";
    email = "matheussouzabarbieri@gmail.com";
    github = "MSBarbieri";
    home = "/home/matheus-barbieri";
  };

  session = {
    editor = "nvim";
    browser = "brave";
    terminal = "kitty";
  };

  desktop = {
    server = "xorg";
    autologin = true;
  };
in {
  home-desktop = let
    machine = "home-desktop";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        fenix.overlays.default
      ];
    };
  in
    nixosSystem {
      inherit system;
      modules =
        [
          ../machines/home-desktop
        ]
        ++ defaultModules
        ++ desktopLinuxModules;
      specialArgs = {inherit inputs machine system pkgs user desktop session;};
    };
}
