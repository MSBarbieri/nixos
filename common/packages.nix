{
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
}
