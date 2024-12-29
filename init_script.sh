# Update the system
# sudo apt install --upgrade

# Install Nix Home Manager
sh <(curl -L https://nixos.org/nix/install) --daemon
# Do all the home-manager stuff...

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/james/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/james/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install GCC with Brew
brew install gcc

# Install Snap for flatpack apps
# sudo apt install snapd kitty xclip

# Install some apps
# VSCODE
# sudo snap install --classic code

# brew install lazygit

sudo ln -sf $(which zsh) /bin/zsh
# Update the /etc/passwd file to change james user shell to /bin/zsh

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Change default terminal emulator (modifies a /bin file so needs sudo)
sudo update-alternatives --config x-terminal-emulator

# Update the boot config to show detailed messages
# /boot/efi/loader/entries/Pop_OS-current.conf

# title Pop!_OS
# linux /EFI/Pop_OS-5addf8e1-ccf9-4bce-a1d6-228498aee27d/vmlinuz.efi
# initrd /EFI/Pop_OS-5addf8e1-ccf9-4bce-a1d6-228498aee27d/initrd.img
# options root=UUID=5addf8e1-ccf9-4bce-a1d6-228498aee27d ro quiet loglevel=0 systemd.show_status=false splash

# title Pop!_OS
# linux /EFI/Pop_OS-5addf8e1-ccf9-4bce-a1d6-228498aee27d/vmlinuz.efi
# initrd /EFI/Pop_OS-5addf8e1-ccf9-4bce-a1d6-228498aee27d/initrd.img
# options root=UUID=5addf8e1-ccf9-4bce-a1d6-228498aee27d ro loglevel=0 systemd.show_status=true

