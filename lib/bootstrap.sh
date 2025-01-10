#!/usr/bin/env bash

echo "\n # You need to provide some information for home-manager to be able to manage your dotfiles."
read -p "> git full name (e.g. John Doe):" GITFULLNAME
read -p "> git mail (e.g. johndoe@example.net):" GITMAIL

# Write home-manager configuration (could change per user and/or platform/device)
echo "
{
  username = "$USER";
  homeDirectory = "$HOME";
  gitFullName = "$GITFULLNAME";
  gitMail = "$GITMAIL";
}
" > $HOME/.config/home-manager/configuration.nix

# install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# install home-manager
/bin/bash -c "$(nix-shell '<home-manager>' -A install)"

# install homebrew if on MacOS
if [[ $(uname) -eq "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install yabai skhd
fi

# build home directory with home-manager
/bin/bash -c "$(home-manager switch)"

echo "The system is now configured as specified by the nix files. You may want to close the current shell and reopen a new one"
