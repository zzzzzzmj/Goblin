alias ..='cd ..'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias ppm='pipenv run python manage.py'
alias prun='pipenv run' 
alias pshell='pipenv shell'
alias ppmm='ppm makemigrations'

alias flake='flake8 `git diff --name-only HEAD~`'
alias rabbit='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmq-server -detached'
alias rabbit-stop='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmqctl stop'
alias redis-server='redis-server /usr/local/etc/redis.conf'

alias gsh='ssh -t agate ssh -t'
alias vim-install='vim +PlugInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

alias ygg='cd ~/zaihui/server && sb && cd ygg'
alias hg='cd ~/zaihui/hunger-game/ && pipenv shell'
alias blog='cd ~/self/zzzzzzmj.github.io'
alias fst="cd ~/zaihui/forseti-be && pipenv shell"

alias self='cd ~/self/ && ls'
alias zaihui='cd ~/zaihui && ls'

alias pf="pipenv run fab"

# func
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
alias rb-dev='rb-dev(){ git f z && git rebase z/dev;};rb-dev'
alias rb='rb(){ git f $1 && git rebase $1/$2;};rb'
alias show='show(){ git stash show -p stash@{$1};};show'
alias wip='wip(){ git add . && git ci -m "wip";};wip'
alias leet='leet(){ mkdir -p $1 && cd $1 && touch solution.py README.md;};leet'

# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc="docker-compose"
alias dps="docker ps"

alias drm='docker rm $(docker ps -a -q)'
alias drmi='rmi(){ docker rmi $(docker images | grep $1 | awk "{print $3}");};rmi'

# jetbrains
alias charm="sh ~/.toolbox/pycharm $1"
alias land="sh ~/.toolbox/goland $1"
alias grip="sh ~/.toolbox/datagrip"

# k8s
alias k='kubectl'
alias kg='kubectl get'
alias kc='kubectl config'
alias kd='kubectl delete'
alias kgp='kubectl get pod'
alias kex='kubectl exec -it'
alias kcg='kubectl config get-contexts'
alias kcu='kcu() { kubectl config use-context $1; };kcu'
alias kpn='kpn() { kubectl get pod | grep $1 | head -n1 | cut -d " " -f1; };kpn'

alias km='kustomize'

# ssh
alias st='ssh -qN -D 127.0.0.1:1080 zhouminjun@agate.kezaihui.com '

alias rm='safe-rm'
