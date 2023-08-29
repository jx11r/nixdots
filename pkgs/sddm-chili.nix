{ lib, pkgs, stdenv, ... }:

let
  qtgraphicaleffects = pkgs.libsForQt5.qt5.qtgraphicaleffects;

  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/jx11r/src/i/wal/mountain.jpg";
    sha256 = "05qb2m388r4zxmd6b7sk8x1g0qgj56x6xbk3hk86qcjh6srq3f5a";
  };
in

stdenv.mkDerivation {
  pname = "sddm-chili";
  version = "0.1.5";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-chili";
    rev = "6516d50176c3b34df29003726ef9708813d06271";
    sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
  };

  propagatedBuildInputs = [
    qtgraphicaleffects
  ];

  dontWrapQtApps = true;

  postInstall = ''
    rm assets/background.jpg
    cp ${wallpaper} assets/background.jpg
    mkdir -p $out/share/sddm/themes/chili
    mv ./* $out/share/sddm/themes/chili/
  '';

  postFixup = ''
    mkdir -p $out/nix-support
    echo ${qtgraphicaleffects} >> $out/nix-support/propagated-user-env-packages
  '';
}
