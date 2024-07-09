echo "\n ### Installing all tools via pacman (sudo)"
sudo pacman -S zsh sed stow git tig docker kubectl vim helix erdtree exa btop bat yazi ripgrep miniforge3 xmonad xmonad-contrib

echo "\n ### Add user to docker group to be safe (sudo)"
sudo useradd -a -G $USER docker
