alias ..='cd ..'
alias ...='cd ../..'
alias ipy='ipython'
alias sb='source env/bin/activate'
alias pm='python manage.py'
alias pr='pipenv run'
alias ppm='pipenv run python manage.py'
alias psh='pipenv shell'
alias ppmm='ppm makemigrations'

alias gpath="cd $GOPATH/src/"

alias vim-install='vim +PlugInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

# git
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
alias rb-dev='rb-dev(){ git f z && git rebase z/dev;};rb-dev'
alias rb='rb(){ git f $1 && git rebase $1/$2;};rb'
alias show='show(){ git stash show -p stash@{$1};};show'
alias wip='wip(){ git add . && git ci -n -m "wip";};wip'
br() { git checkout -b $1 z/dev; }


# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc="docker-compose"
alias dps="docker ps"
alias drm='docker rm $(docker ps -a -q)'
rmi() { docker rmi `docker images | grep $1 | awk '{print $3}'`; }

# k8s
alias k='kubectl'
alias kk='k9s'
alias kx='kubectx'
alias km='kustomize'
alias kg='kubectl get'
alias kc='kubectl config'
alias ka='kubectl apply'
alias kd='kubectl delete'
alias kgp='kubectl get pod'
alias kex='kubectl exec -it'
alias kcg='kubectl config get-contexts'
alias kcu='kubectl config get-contexts -o name| fzf --preview "kubectl config use-context {} && kubectl get ns"'
alias kns='kubectl get ns -o name | sed "s/namespace\///" | fzf --preview "kubectl get all -n {}"'
kpm() { kex `kpo $1` pipenv run python manage.py shell; }
kpo() { kg po | grep $1 | head -n1 | cut -d" " -f1; }
ksh() { kex `kpo $1` -- bash; }

# fzf
alias gbr='git co `git br | fzf`'

unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _zlua "$*" && return
    cd "$(_zlua -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

pbrew() { ALL_PROXY='socks5://127.0.0.1:7890' brew $@; }

# lab
alias lb='lab browser'
alias lo='lab open -p'
alias lc='lab clone'
alias lcl='lab ci -l'
alias ws='cd `lab ws -d 5`'

# tools
alias ra='ranger'
alias lg='lazygit
