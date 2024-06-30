{ pkgs
, lib
, ...
}: {
  imports = [
    ./devenv.nix
    ./fzf.nix
    ./git.nix
    # moving to apps.nix
    # ./kitty.nix
    ./pyenv.nix
    ./zoxide.nix
    ./zsh.nix
    # ./cursor.nix
    # ./htop.nix
    # ./alacritty.nix

    # ./wms/hyprland.nix
    # ./wms/waybar.nix
  ];
}