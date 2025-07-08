#!/bin/bash

# Update package lists and upgrade all installed packages
echo "Updating package lists and upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Install common development tools
echo "Installing common development tools..."
sudo apt install -y git curl build-essential

# Install libunwind-dev (required for some Rust/Wasm toolchains)
echo "Installing libunwind-dev..."
sudo apt install -y libunwind-dev

# Install nvm (Node Version Manager)
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Source nvm to make it available in the current shell session
# This is crucial for subsequent nvm commands to work immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install the latest stable Node.js (which includes npm) via nvm
echo "Installing latest Node.js via nvm..."
nvm install node --lts
nvm use node --lts
nvm alias default node

# Install dfx (Internet Computer SDK)
echo "Installing dfx..."
DFX_VERSION="0.19.0" # You can specify a different version if needed
sh -ci "$(curl -fsSL https://sdk.dfinity.org/install.sh)"

# Add dfx to PATH for the current session (and future sessions if .bashrc is sourced)
export PATH="$PATH:$HOME/bin"

# Install ic-mops globally via npm
echo "Installing ic-mops globally via npm..."
npm i -g ic-mops

# pre installing packagesfrom mops.toml
mops install

# Clean up apt cache to reduce image size (optional, but good practice)
echo "Cleaning up apt cache..."
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*

echo "Dev container setup complete!"