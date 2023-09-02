{ inputs, ... }:

let
  addPatches = pkg: patches: pkg.overrideAttrs (oldAttrs: {
    patches = (oldAttrs.patches or [ ]) ++ patches;
  });

  overlays = [
    inputs.wired.overlays.default
    (import ./python3.nix)
  ];
in

overlays ++ builtins.attrValues {
  packages = final: _: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    neofetch = addPatches prev.neofetch [ ./patches/neofetch.diff ];
  };
}
