{ stdenv, fetchurl }:
{
  sddm-eucalyptus-drop = stdenv.mkDerivation rec {
    pname = "sddm-eucalyptus-drop-theme";
    version = "2.0.0";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/eucalyptus-drop
    '';
    src = fetchurl {
      url = "https://gitlab.com/api/v4/projects/37107648/packages/generic/sddm-eucalyptus-drop/${version}/sddm-eucalyptus-drop-v${version}.zip";
      sha256 = "159p8fnyiarpqin6w1sayvxa7q1mrvcxhvzfi1a5dlzj5myghl2y"; # replace with actual sha256
    };
  };
}
