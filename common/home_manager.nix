{
  config,
  lib,
  lib',
  user,
  desktop,
  session,
  machine,
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
      extraSpecialArgs = {inherit user desktop session machine;};
    };
  };
}
