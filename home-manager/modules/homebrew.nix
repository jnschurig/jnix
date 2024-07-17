{ pkgs, lib, ... }:

let
  brewSrc = pkgs.fetchFromGitHub {
    owner = "Homebrew";
    repo = "brew";
    rev = "master"; # You can replace "master" with a specific commit if needed
    sha256 = "sha256-FVusddGUPR0JxFAVMMytoN41cv1lEwOhaPenyd5j3Zo="; # Replace with the actual SHA256 hash
  };
in
pkgs.stdenv.mkDerivation {
  name = "homebrew";
  src = brewSrc;

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';
}
