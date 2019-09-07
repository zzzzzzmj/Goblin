alias c='cd ..'
alias ..='cd ..'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias ppm='pipenv run python manage.py'
alias prun='pipenv run'
alias pshell='pipenv shell'

alias gssh='ssh -t gate ssh -t'
alias vim-install='vim +PluginInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

alias pf="pipenv run fab"

# func
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
alias rb-dev='rb-dev(){ git f z && git rebase z/dev;};rb-dev'
alias rb='rb(){ git f $1 && git rebase $1/$2;};rb'
alias show='show(){ git stash show -p stash@{$1};};show'

# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc="docker-compose"
alias dps="docker ps"

alias drm='docker rm $(docker ps -a -q)'
alias drmi='rmi(){ docker rmi $(docker images | grep $1 | awk "{print $3}");};rmi'
