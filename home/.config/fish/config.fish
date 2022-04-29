#source /etc/static/fish/config.fish

alias fs='source ~/.config/fish/config.fish'
alias fi='vi ~/.config/fish/config.fish'

if status is-interactive
    # Commands to run in interactive sessions can go herea
	mullvad status
end

#mullvad connect

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

alias gs='git status'
alias gcl='git clone'
alias gc='git commit'
alias gco='git checkout'
alias gf='git fetch -vp'
alias gp='git pull --rebase'
alias gri='git rebase -i'
alias grs='git reset'

alias snap='tmutil localsnapshot'


