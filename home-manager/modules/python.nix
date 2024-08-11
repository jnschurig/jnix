{ config
, lib
, pkgs
, zlib
, ...
}: 

let
  venv_tarball = pkgs.fetchurl {
    url = "https://github.com/pyenv/pyenv-virtualenv/archive/refs/tags/v1.2.3.tar.gz";
    sha256 = "0mmnlp49zcnqd4rj3ngzz9dc5p2zc857jpxsb72agxkbkn729w12";
  };

  venv_unpacked = pkgs.stdenv.mkDerivation {
    name = "pyenv-virtualenv";
    src = venv_tarball;
    phases = [ "unpackPhase" "installPhase" ];
    unpackPhase = ''
      mkdir -p $out
      tar -xzf $src -C $out
    '';
    installPhase = ''
      mkdir -p $out
      mv $out/pyenv-virtualenv-* $out/pyenv-virtualenv
    '';
    # installPhase = ''
    #   mkdir -p $out
    #   cp -r $out/pyenv-virtualenv-*/* $out
    # '';
  };

in {
  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
  };

  home = let 
    profile_text = ''
      # export PYENV_ROOT="$HOME/.pyenv"
      # export PYENV_ROOT="${pkgs.pyenv.out}"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init --path)"
    '';
  in {

    # file.".pyenv/bin" = {
    file.".local/share/pyenv" = {
      # source = "${pkgs.pyenv.out}";
      source = pkgs.pyenv.out;
      recursive = true;
    };

    file.".profile".text = "${profile_text}";
    file.".zprofile".text = "${profile_text}";
  };

      # export PATH=${pkgs.pyenv}/bin:$PATH
      # # [[ -d $PYENV_ROOT/bin ]] && export PATH="${pkgs.pyenv}/bin:$PATH"
      # eval "$(pyenv init -)"


  # This will add the plugin from above to the pyenv dir. However, it doesn't work right...
  # home.file.".pyenv/plugins" = {
  #   source = "${venv_unpacked}";
  #   recursive = true;
  # };
}
