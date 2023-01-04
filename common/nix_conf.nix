{
  pkgs,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Automate garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Flakes settings
    package = pkgs.nixVersions.stable;
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      # Automate `nix store --optimise`
      auto-optimise-store = true;

      # Required by Cachix to be used as non-root user
      trusted-users = ["root" "matheus-barbieri"];

      experimental-features = ["nix-command" "flakes"];

      # Avoid unwanted garbage collection when using nix-direnv
      keep-outputs = true;
      keep-derivations = true;
    };
  };
}
