{ pkgs, ... }:

let
  writeScript = pkgs.writeShellScriptBin;
  readFile = builtins.readFile;

  nixos = writeScript "nixos" (readFile ./nixos.sh);
in

[ nixos ]
