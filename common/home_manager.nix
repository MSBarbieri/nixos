{
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
}
