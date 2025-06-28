#!/bin/bash

# Install CLI testing and benchmarking tools
set -e

echo "Installing CLI testing tools..."

# Update package list
sudo apt-get update

# Install dependencies
sudo apt-get install -y curl wget build-essential libkrb5-dev

# Install Bats (Bash Automated Testing System)
echo "Installing Bats..."
git clone https://github.com/bats-core/bats-core.git /tmp/bats-core
cd /tmp/bats-core
sudo ./install.sh /usr/local
cd -
rm -rf /tmp/bats-core

# Install ShellSpec
echo "Installing ShellSpec..."
curl -fsSL https://git.io/shellspec | sh -s -- --yes
sudo ln -sf ~/.local/lib/shellspec/shellspec /usr/local/bin/shellspec

# Install Hyperfine
echo "Installing Hyperfine..."
HYPERFINE_VERSION="1.18.0"
wget "https://github.com/sharkdp/hyperfine/releases/download/v${HYPERFINE_VERSION}/hyperfine_${HYPERFINE_VERSION}_amd64.deb" -O /tmp/hyperfine.deb
sudo dpkg -i /tmp/hyperfine.deb
rm /tmp/hyperfine.deb

# Verify installations
echo "Verifying installations..."
bats --version
shellspec --version
hyperfine --version

echo "CLI testing tools installation complete!"