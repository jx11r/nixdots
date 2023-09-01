{ pkgs, ... }:

let
  writeScript = pkgs.writeShellScriptBin;
  readFile = builtins.readFile;

  checkupdates = writeScript "checkupdates" (readFile ./checkupdates.sh);
in

[ checkupdates ]
