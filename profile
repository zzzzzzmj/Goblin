alias ..='cd ..'
alias ...='cd ../..'
alias ipy='ipython'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias pr='pipenv run'
alias pf="pipenv run fab"
alias ppm='pipenv run python manage.py'
alias pshell='pipenv shell'
alias ppmm='ppm makemigrations'

alias gpath="cd $GOPATH/src/"

alias sssh='ssh -t agate ssh -t'
alias vim-install='vim +PlugInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

# func
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
alias rb-dev='rb-dev(){ git f z && git rebase z/dev;};rb-dev'
alias rb='rb(){ git f $1 && git rebase $1/$2;};rb'
alias show='show(){ git stash show -p stash@{$1};};show'
alias wip='wip(){ git add . && git ci -n -m "wip";};wip'
alias leet='leet(){ mkdir -p $1 && cd $1 && touch solution.py solution.go solution_test.go README.md;};leet'

# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc="docker-compose"
alias dps="docker ps"

alias drm='docker rm $(docker ps -a -q)'
alias drmi='rmi(){ docker rmi $(docker images | grep $1 | awk "{print $3}");};rmi'

# k8s
alias k='kubectl'
alias km='kustomize'
alias kg='kubectl get'
alias kc='kubectl config'
alias kf='kubectl apply -f'
alias kk='kubectl apply -k'
alias kd='kubectl delete'
alias kgp='kubectl get pod'
alias kex='kubectl exec -it'
alias kcg='kubectl config get-contexts'
alias kcu='kubectl config use `kubectl config get-contexts -o name| fzf`'
kcl() { if [[ -z "$1" ]]; then kubectl config get-contexts; else kubectl config use-context $1; fi; }
kns() { if [[ -z "$1" ]]; then kubectl get ns; else kubectl config set-context --current --namespace $1; fi; }
kpm() { kex `kpo $1` pipenv run python manage.py shell; }
kpo() { kg po | grep $1 | head -n1 | cut -d" " -f1; }
ksh() { kex `kpo $1` -- bash; }

alias rm='safe-rm'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'


# fzf
alias gbr='git co `git br | fzf`'
