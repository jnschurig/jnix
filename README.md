# jnix

1. Clone the repo or copy all the files to ${dir}
2. From the terminal run
```bash
sudo nixos-rebuild switch --flake ${dir}
reboot
home-manager switch --flake ${dir}
```
3. Enjoy!

-----

## For running on Arch...
1. Install nix: `sh <(curl -L https://nixos.org/nix/install) --daemon`
2. Install hyprland and others: `sudo pacman -S hypridle hyprpaper hyprland hyprlock waybar kitty base-devel rofi lazygit`
2. Enter a nix-shell with home-manager `nix-shell -p home-manager`
3. Build the home-manager flake `home-manager switch --flake ~/git/jnix --extra-experimental-features nix-command --extra-experimental-features "flakes nix-command"`
4. profit?