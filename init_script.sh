# Update the system
sudo apt install --upgrade

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
sudo apt install snapd kitty

# Install some apps
# VSCODE
sudo snap install --classic code

brew install lazygit

sudo ln -sf $(which zsh) /bin/zsh

