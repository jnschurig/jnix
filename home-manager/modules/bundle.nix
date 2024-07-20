{ pkgs
, lib
, ...
}: {
  imports = [
    ./cursor.nix
    ./fzf.nix
    ./git.nix
    ./mako.nix
    ./homebrew.nix
    ./python.nix
    # ./_2ship2harkinian.nix
    # ./shipwright.nix
    ./zoxide.nix
    ./zsh.nix
    # ./htop.nix

    ./wms/hyprland.nix
    ./wms/hyprlock.nix
    ./wms/waybar.nix
    ./wms/wms_scripts.nix
  ];
}
