{ pkgs
, lib
, ...
}: {
  imports = [
    # ./cursor.nix
    ./fzf.nix
    ./git.nix
    ./lazygit.nix
    ./kitty.nix
    # ./mako.nix
    # ./qt.nix
    # ./python.nix
    # ./_2ship2harkinian.nix
    # ./shipwright.nix
    ./zoxide.nix
    ./zsh.nix
    # ./htop.nix

    # ./wms/hypridle.nix
    # ./wms/hyprland.nix
    # ./wms/hyprlock.nix
    # ./wms/hyprpaper.nix
    # ./wms/waybar.nix
    # ./wms/wms_scripts.nix
  ];
}
