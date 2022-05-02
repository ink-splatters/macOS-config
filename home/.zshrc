#source /etc/static/zshrc

alias n='nix --extra-experimental-features nix-command --extra-experimental-features flakes'
alias nu='n upgrade-nix'
alias ns='nix-shell'
alias ne='nix-env'
alias nb='nix-build'
alias ni='nix-instantiate'
alias gc='nix-collect-garbage'
alias e='ne -e'
alias s='ne -qa'

alias u='ne -e'


alias fi='vim ~/.zshrc'
alias fs='source ~/.zshrc'

function i() {
	typeset -a args
	
	for arg in "$@" ; do
		args+=("nixpkgs.$arg")
	done

	echo "${args[*]}" | tee >(xargs echo -- installing using command) | xargs -I@ sh -c 'nix-env -iA @'

}


alias snap='tmutil localsnapshot'

alias gs='git status'
alias gcl='git clone'
alias gc='git commit'
alias gco='git checkout'
alias gf='git fetch -vp'
alias gp='git pull --rebase'
alias gri='git rebase -i'
alias grs='git reset'

alias status='mullvad status'
alias connect='mullvad connect'
alias disconnect='mullvad disconnect' 
alias snap='tmutil localsnapshot'
alias l='ls -AleO@'

export PATH="$PATH:$HOME/.cargo/bin"
