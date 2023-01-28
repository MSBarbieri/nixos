{
  description = "NixOs Config by Matheus Barbieri";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-ld.url = "github:Mic92/nix-ld";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    user = {
      username = "matheus-barbieri";
      email = "matheussouzabarbieri@gmail.com";
      github = "MSBarbieri";
    };

    session = {
      editor = "nvim";
      browser = "brave";
      terminal = "kitty";
      auto-loggin = true;
    };

    desktop = {
      home = "/home/matheus-barbieri/";
      server = "xorg";
    };
  in {
    nixosConfigurations = (
      import ./outputs/nixos.nix {
        inherit inputs user session desktop;
      }
    );
  };
}
