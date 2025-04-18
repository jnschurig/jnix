#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e
sudo -v

# Update the system
# echo "Updating the system..."
# sudo apt update && sudo apt upgrade -y

# Install Homebrew
echo "Installing Homebrew..."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" | sh

# Add Homebrew to bashrc for persistent environment variables
echo "Adding Homebrew to ~/.bashrc..."
# echo >> $HOME/.bashrc
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install GCC with Brew
echo "Installing GCC with Brew..."
brew install gcc

# Install Snap and other apps
# echo "Installing Snapd and other utilities..."
# sudo apt install -y snapd kitty xclip

# Install VSCode via Snap
# echo "Installing VSCode..."
# sudo snap install --classic code

# Install LazyGit with Brew
echo "Installing LazyGit..."
brew install lazygit

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
sudo ln -sf $(which zsh) /bin/zsh
# Change the shell in /etc/passwd (assuming the user is 'james')
sudo usermod --shell /bin/zsh james

# Find the path to zsh
ZSH_PATH=$(which zsh)

# Check if zsh is installed
if [ -z "$ZSH_PATH" ]; then
  echo "zsh is not installed."
  exit 1
fi

# Check if the zsh path is already in /etc/shells
if grep -Fxq "$ZSH_PATH" /etc/shells; then
  echo "$ZSH_PATH is already in /etc/shells."
else
  # Append the zsh path to /etc/shells
  echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  echo "$ZSH_PATH has been added to /etc/shells."
fi

# Install UV

# Check if UV is installed
if ! command -v uv &>/dev/null; then
  echo "UV is not installed. Installing UV..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  echo "UV is already installed."
fi

# Change the default terminal emulator (requires sudo)
# echo "Changing default terminal emulator to kitty..."
# sudo update-alternatives --config x-terminal-emulator $(which kitty)

# Install Nix Home Manager

# Check if Nix is installed
if ! command -v nix &>/dev/null; then
  echo "Nix is not installed. Installing Nix Home Manager..."

  # Install Nix Home Manager
  sh <(curl -L https://nixos.org/nix/install) --daemon
else
  echo "Nix is already installed."
fi
# Do all the home-manager stuff (assume you will configure it later)

# Set user's default shell to be zsh
sudo sed -i "s|\($USER.*\)/bash|\1/zsh|" /etc/passwd

sh ./pacman.sh
sh ./init_script.sh
sh ./flatpak.sh

echo "Setup complete!"
