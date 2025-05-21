#!/bin/bash

install_tpm_if_missing() {
  echo "Checking for and cloning TPM for tmux..."
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "TPM has been cloned."
  else
    echo "TPM already exists, skipping cloning."
  fi
}

link_dotfiles() {
  echo "Linking dotfiles using Stow..."
  stow .
  echo "Dotfiles have been linked."
}

install_tpm_if_missing
link_dotfiles

echo "Installation complete!"