alias c='cd ..'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias ppm='pipenv run python manage.py'
alias prun='pipenv run'
alias pshell='pipenv shell'

alias flake='flake8 `git diff --name-only HEAD~`'
alias rabbit='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmq-server -detached'
alias rabbit-stop='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmqctl stop'
alias redis-server='redis-server /usr/local/etc/redis.conf'

alias gsh='ssh -t gate ssh -t'
alias vim-install='vim +PluginInstall +qall'
alias cgd='hexo clean && hexo g && hexo d'

alias ygg='cd ~/zaihui/server && sb && cd ygg'
alias hg='cd ~/zaihui/hunger-game && sb && cd src'
alias blog='cd ~/self/zzzzzzmj.github.io'
alias fst="cd ~/zaihui/forseti-be && pipenv shell"

alias self='cd ~/self/ && ls'
alias zaihui='cd ~/zaihui && ls'

alias pf="pipenv run fab"
alias yapf_hg='yapf -r -d  forseti/takeaway'

# docker
alias d='docker'
alias dl='docker images'
alias dr='docker run -it'
alias db='docker build'
alias dc="docker-compose"
alias dps="docker ps"

# func
alias dbr='del(){ git br | grep $1 | xargs git br -D;};del'
