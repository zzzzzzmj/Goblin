alias ..='cd ..'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias pr='pipenv run'
alias pf='pipenv run fab'
alias ppm='pipenv run python manage.py'
alias ps='pipenv shell'
alias ppmm='ppm makemigrations'

alias sssh='ssh -t agate ssh -t'
alias vim-install='vim +PlugInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

# func
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
alias rb-dev='rb-dev(){ git f z && git rebase z/dev;};rb-dev'
alias rb='rb(){ git f $1 && git rebase $1/$2;};rb'
alias show='show(){ git stash show -p stash@{$1};};show'
alias wip='wip(){ git add . && git ci -m 'wip';};wip'
alias leet='leet(){ mkdir -p $1 && cd $1 && touch solution.py solution.go solution_test.go README.md;};leet'

# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc='docker-compose'
alias dps='docker ps'
alias drm='docker rm $(docker ps -a -q)'
alias drmi='rmi(){ docker rmi $(docker images | grep $1 | awk '{print $3}');};rmi'

# k8s
alias k='kubectl'
alias kg='kubectl get'
alias kc='kubectl config'
alias kd='kubectl delete'
alias kf='kubectl apply -f'
alias kk='kubectl apply -k'
alias kgp='kubectl get pod'
alias kex='kubectl exec -it'
alias kcg='kubectl config get-contexts'
alias kcu='kcu() { kubectl config use-context $1; };kcu'
alias kpn='kpn() { kubectl get pod | grep $1 | head -n1 | cut -d ' ' -f1; };kpn'
alias km='kustomize'

# other
alias tr='docker run -i -t -P --rm soimort/translate-shell'
