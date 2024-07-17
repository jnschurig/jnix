{ pkgs
, lib
, ...
}: {
  imports = [
    ./cursor.nix
    ./fzf.nix
    ./git.nix
    ./python.nix
    # ./_2ship2harkinian.nix
    # ./shipwright.nix
    ./zoxide.nix
    ./zsh.nix
    # ./htop.nix

    ./wms/hyprland.nix
    ./wms/waybar.nix
  ];
}