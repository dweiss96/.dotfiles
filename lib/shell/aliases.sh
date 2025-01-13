#######################
# file mgmt commands  #
#######################
alias b='bat'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias lx="exa -lahg --git"
alias ll_exa="exa -T -L 2 --icons --group-directories-first -s name"
alias la_exa="exa -a -T -L 2 --icons --group-directories-first -s name"
alias ll_erd="erd -H -L 1"
alias la_erd="erd -H -. -L 1"
alias find_in_files="rg -e"
alias count_in_files="rg -c -e"
alias find_in_files_unfiltered="rg -uuu -e"
alias count_in_files_unfiltered="rg -cuuu -e"
function ld_erd {
	erd -H -. -L $1
}
function find_erd {
	erd -H -. -p $1
}
function mkcd {
	if [ ! -n "$1" ]; then
		echo "Enter a directory name"
	elif [ -d $1 ]; then
		echo "'$1' already exists"
	else
		mkdir $1 && cd $1
	fi
}
function mkpcd {
	mkdir -p $1
	cd $1
}
# cd to file paths directory
function cdf {
  cd $(dirname "$1")
}

#######################
#      git stuff      #
#######################
alias g='git'
alias cgs="clear && git status"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias groot='cd $(git rev-parse --show-toplevel)'
alias nb="new_branch_from_ticket"
function new_branch_from_ticket {
	BRANCHNAME_DEST=$(echo "$2" | tr '[:upper:]' '[:lower:]' | sed -e "s/ /-/g; s/://g; s/ä/ae/g; s/ö/oe/g; s/ü/ue/g; s/ß/ss/g;")
	BRANCHNAME_DEST=$(echo "$1"-"$BRANCHNAME_DEST")
	BRANCHNAME_SRC=$(git rev-parse --abbrev-ref HEAD)
	git switch -c "$BRANCHNAME_DEST" "$BRANCHNAME_SRC"
}
function cleanup_branches {
	local red="$(tput setaf 1)"
	local green="$(tput setaf 2)"
	local bold="$(tput bold)"
	local reset="$(tput sgr0)"

	local current_branch="$(git rev-parse --abbrev-ref HEAD)"
	for branch in $(git branch | grep --extended-regexp --invert-match "main|develop|$current_branch" | cut -c3-); do
		echo "Branch ${bold}$branch${reset} is already merged into ${bold}$current_branch${reset}."
		echo "Would you like to delete it? ${green}[Y]es${reset}/${red}[N]o${reset} "
		read -r REPLY
		if [[ $REPLY =~ ^[Yy] ]]; then
			git branch -D "$branch"
			git push --delete origin "$branch"
		fi
	done
}
# git mapping all existing git aliases
GIT_ALIASES=$(git config -l | grep alias | sed "s/alias.\([a-zA-Z]*\)=.*/\1/g")
for al in "$GIT_ALIASES"; do
	alias g$al="git $al"
done

#######################
#     scala stuff     #
#######################
alias sfmtCheck="sbt scalafmtCheck Test/scalafmtCheck IntegrationTest/scalafmtCheck scapegoat"
alias sfmt="sbt clean compile scalafmt Test/scalafmt IntegrationTest/scalafmt"
alias scalaFullEndFmt="sbt clean compile scalafmt Test/scalafmt IntegrationTest/scalafmt test IntegrationTest/test"
alias scalac="clear && sbt clean compile --error"

#######################
#   container stuff   #
#######################
alias kc="kubectl"
alias d="docker"
alias dco="docker compose"
alias drit="docker_run_interactive_shell"
alias docker_purge="docker rm $(docker ps -aq -f exited=0 -f exited=137)"
alias ghub_ci="act --container-architecture linux/amd64"
function docker_run_interactive_shell {
	docker run --interactive --tty "$1" /bin/sh
}

#######################
#      gpg stuff      #
#######################
alias gpge="gpg_encrypt"
alias enc="gpg_encrypt"
alias gpgd="gpg_decrypt"
alias dec="gpg_decrypt"
function gpg_encrypt {
	gpg --encrypt -a --recipient "$1" "$2"
}
function gpg_decrypt {
	gpg --decrypt "$1"
}

#######################
#     apple stuff     #
#######################
alias kill_dns="sudo killall -HUP mDNSResponder"
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

#######################
#    various stuff    #
#######################
alias get_ipv4='ifconfig | grep "inet "'
alias get_public_ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias reset_adb="adb kill-server && adb start-server"
alias k9="kill -9"
alias wetter="curl https://wttr.in"
alias rread="$DOTFILEDIR/scripts/rread"
alias rreadme="$DOTFILEDIR/scripts/rread README.md"
alias curltime="curl -o /dev/null -s -w 'Total: %{time_total}s\n'"
alias ap="ansible-playbook"
alias av="ansible-vault"
