# This package isn't fully ready yet. I still struggle with nix.
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "sddm-eucalyptus-drop";
  version = "2.0.0";

  src = pkgs.fetchurl {
    url = "https://gitlab.com/api/v4/projects/37107648/packages/generic/${pname}/${version}/${pname}-v${version}.zip";
    sha256 = "159p8fnyiarpqin6w1sayvxa7q1mrvcxhvzfi1a5dlzj5myghl2y";
  };

  nativeBuildInputs = [ pkgs.sddm-kcm ];

  installPhase = ''
    sddmthemeinstaller --install ${pname}-v${version}.zip
  '';

  meta = with pkgs.lib; {
    description = "A Nix package to install the SDDM theme 'Eucalyptus Drop'";
    homepage = "https://gitlab.com/<appropriate-link>";
    license = licenses.mit;
    maintainers = with maintainers; [ "yourName" ];
  };
}
