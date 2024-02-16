HISTCONTROL=ignoreboth
HISTCONTROL=ignoreboth

export DOTFILEDIR="$HOME/.dotfiles"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# MAC ZSH coreutils fix
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

source "$DOTFILEDIR/shell/style.sh"

# AutoSuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$DOTFILEDIR/shell/aliases.sh"
source "$DOTFILEDIR/shell/paths.sh"
source "$DOTFILEDIR/shell/yabai.sh"

# Work specific ALIAS (not in git for safety reasons)
for file in $(find $DOTFILEDIR/work -type f)
do
  if [ -f "$file" ]; then
    source $file
  fi
done

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# run mvn test for single test class ($1=<test class>) or single test method in test class $1=<test class#test method>
mst() {
  mvn clean -Dtest="$1" test
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export VCPKG_ROOT="$HOME/vcpkg"


PATH=$(pyenv root)/shims:$PATH

# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END

OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "$HOME/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

