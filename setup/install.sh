#!/usr/bin/env bash

set +e
set -o noglob
IFS=' '

# shellcheck source=bin/utils.sh
source "$(dirname "$0")/utils.sh"

readonly use_asdf="${USE_ASDF:-1}"

install_brew_dependencies() {
	if ! brew bundle check &>/dev/null; then
		run_command "brew bundle install"
    run_command "brew install --cask hiddenbar"
	fi
}

add_asdf_plugins() {
	if ! asdf list nodejs &>/dev/null ; then
		run_command "asdf plugin-add nodejs"
		run_command "bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring"
	fi
	
  if ! asdf list yarn &>/dev/null ; then
		run_command "asdf plugin-add yarn"
	fi

  if ! asdf list ruby &>/dev/null ; then
		run_command "asdf plugin-add ruby"
	fi

  if ! asdf list golang &>/dev/null ; then
		run_command "asdf plugin-add golang"
	fi

  if ! asdf list rust &>/dev/null ; then
		run_command "asdf plugin-add rust"
	fi
}

install_asdf_dependencies() {
	run_command "asdf plugin update nodejs"
	run_command "asdf plugin update yarn"
	run_command "asdf plugin update ruby"
	run_command "asdf plugin update golang"
	run_command "asdf plugin update rust"
	run_command "asdf install"
	run_command "asdf reshim"
  run_command "asdf global nodejs 16.16.0"
  run_command "asdf global yarn 1.22.11"
  run_command "asdf global ruby 2.6.6"
  run_command "asdf global golang 1.14"
  run_command "asdf global rust 1.65.0"
}

setup_ohmyzsh() {
  OMZ_DIR="$HOME/.oh-my-zsh"
  if [ -d "$OMZ_DIR" ] ; then
    echo "oh-my-zsh exist, skip installing"
  else
    echo "oh-my-zsh doesn't exist, installing"
    run_command 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  fi

  if [ -f "$HOME/.zshrc" ]; then
    run_command 'rm ~/.zshrc'
  fi

  SPACESHIP_THEME_DIR="$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"
  OMZ_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"
  if [ ! -d "$SPACESHIP_THEME_DIR" ]; then
    echo "Theme folder not exist"
    run_command 'git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$OMZ_CUSTOM_DIR/themes/spaceship-prompt" --depth=1'
    run_command 'ln -s "$OMZ_CUSTOM_DIR/spaceship-prompt/spaceship.zsh-theme" "$OMZ_CUSTOM_DIR/themes/spaceship.zsh-theme"'
  fi
  run_command 'ln -s $HOME/Documents/Github/Home/dotfiles/.zshrc ~/'
}

setup_lvim() {
  if ! which lvim &>/dev/null; then
    echo "Lunarvim is not exist"
    run_command "bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y"
    run_command "rm -rf $HOME/.config/lvim"
    run_command "ln -s $HOME/Documents/Github/home/lvim $HOME/.config/"
  fi
}

main() {
	install_brew_dependencies
  add_asdf_plugins
  install_asdf_dependencies
  setup_ohmyzsh
  setup_lvim
}

main "$@"
