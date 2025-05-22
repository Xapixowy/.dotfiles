#!/bin/bash

START_SYM="===>"
SUCCESS_SYM="[OK]"
ERROR_SYM="[ERROR]"
INFO_SYM="[INFO]"
FIRST_LEVEL_SYM=" •"

link_dotfiles() {
  echo "$START_SYM Linking dotfiles with Stow..."
  stow .
  local stow_exit_code=$?

  if [ $stow_exit_code -eq 0 ]; then
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM Dotfiles linked."
  elif [ $stow_exit_code -eq 1 ]; then
    echo "$FIRST_LEVEL_SYM $ERROR_SYM Stow: Conflict. Files already exist."
  elif [ $stow_exit_code -eq 2 ]; then
    echo "$FIRST_LEVEL_SYM $ERROR_SYM Stow: Invalid usage or package issue."
  else
    echo "$FIRST_LEVEL_SYM $ERROR_SYM Stow: Unknown error (code: $stow_exit_code)."
  fi
}

install_homebrew_if_missing() {
  echo "$START_SYM Checking for Homebrew..."
  if ! command -v brew &> /dev/null; then
    echo "$FIRST_LEVEL_SYM $INFO_SYM Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM Homebrew installed."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM Homebrew already installed, skipping installation."
  fi
}

install_oh_my_zsh_if_missing() {
  echo "$START_SYM Checking for and cloning Oh My Zsh..."
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.oh-my-zsh"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM Oh My Zsh has been cloned."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM Oh My Zsh already exists, skipping cloning."
  fi
}

install_starship_if_missing() {
  echo "$START_SYM Checking for Starship (via Brew)..."

  if command -v starship &>/dev/null; then
    echo "$FIRST_LEVEL_SYM $INFO_SYM Starship is already installed. Skipping installation."
  else
    brew install starship
    local brew_exit_code=$?

    if [ $brew_exit_code -eq 0 ]; then
      echo "$FIRST_LEVEL_SYM $SUCCESS_SYM Starship installed successfully."
    else
      echo "$FIRST_LEVEL_SYM $ERROR_SYM Failed to install Starship with Brew (exit code: $brew_exit_code)."
    fi
  fi
}

install_zsh_completions() {
  echo "$START_SYM Checking for and cloning zsh-completions plugin..."
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM zsh-completions plugin has been cloned."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM zsh-completions plugin already exists, skipping cloning."
  fi
}

install_zsh_syntax_highlighting() {
  echo "$START_SYM Checking for and cloning zsh-syntax-highlighting plugin..."
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM zsh-syntax-highlighting plugin has been cloned."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM zsh-syntax-highlighting plugin already exists, skipping cloning."
  fi
}

install_zsh_autosuggestions_plugin_if_missing() {
  echo "$START_SYM Checking for and cloning zsh-autosuggestions plugin..."
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM zsh-autosuggestions plugin has been cloned."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM zsh-autosuggestions plugin already exists, skipping cloning."
  fi
}

install_tmux_tpm_if_missing() {
  echo "$START_SYM Checking for and cloning TPM for tmux..."
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "$FIRST_LEVEL_SYM $SUCCESS_SYM TPM has been cloned."
  else
    echo "$FIRST_LEVEL_SYM $INFO_SYM TPM already exists, skipping cloning."
  fi
}

install_diff_so_fancy() {
  echo "$START_SYM Checking for diff-so-fancy (via Brew)..."

  if command -v diff-so-fancy &>/dev/null; then
    echo "$FIRST_LEVEL_SYM $INFO_SYM diff-so-fancy is already installed. Skipping installation."
  else
    brew install diff-so-fancy
    local brew_exit_code=$?

    if [ $brew_exit_code -eq 0 ]; then
      echo "$FIRST_LEVEL_SYM $SUCCESS_SYM diff-so-fancy installed successfully."
    else
      echo "$FIRST_LEVEL_SYM $ERROR_SYM Failed to install diff-so-fancy with Brew (exit code: $brew_exit_code)."
    fi
  fi
}

main() {
  # link_dotfiles
  install_homebrew_if_missing
  install_oh_my_zsh_if_missing
  install_starship_if_missing
  install_zsh_completions
  install_zsh_syntax_highlighting
  install_zsh_autosuggestions_plugin_if_missing
  install_tmux_tpm_if_missing
  install_diff_so_fancy
}

main
echo -e "\n🚀 Installation complete!"