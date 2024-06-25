# jnix

For now my config needs a symlink to /etc/nixos to work properly.

```bash
cd ~
mkdir git
cd git

git clone git@github.com:jnschurig/jnix.git

sudo mv /etc/nixos /etc/nixos_bak
sudo ln -s /home/james/git/jnix/nixos /etc/nixos

sudo nixos-rebuild switch
```

Do not use `flake.nix` just yet. Coming soon hopefully.


```bash
git clone https://github.com/Andrey0189/nixos-config
mv nixos-config $HOME/nix # Config is supposed to be in the ~/nix directory
cd $HOME/nix
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```