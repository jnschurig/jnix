{
  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;

    initExtra = ''
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    '';
  };
}