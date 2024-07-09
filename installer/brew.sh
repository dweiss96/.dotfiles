echo "\n ### Update brew repo index (sudo)"
brew update

echo "\n ### Please install docker from https://docs.docker.com/desktop/install/mac-install/"
read -p "> Press Enter to continue"READY

echo "\n ### Installing all tools via brew"
brew install sed stow git tig kubectl vim helix erdtree exa btop bat yazi ripgrep miniforge3
