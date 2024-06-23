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
