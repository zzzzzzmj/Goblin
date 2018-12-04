alias c='cd ..'
alias sb='source env/bin/activate'
alias de='deactivate'
alias pm='python manage.py'
alias ppm='pipenv run python manage.py'
alias flake='flake8 `git diff --name-only HEAD~`'
alias rabbit='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmq-server -detached'
alias rabbit-stop='cd /usr/local/Cellar/rabbitmq/3.7.8 && ./sbin/rabbitmqctl stop'
alias redis-server='redis-server /usr/local/etc/redis.conf'
alias gsh='ssh -t gate ssh -t'
alias vim-install='vim +PluginInstall +qall'
alias ygg='cd ~/zaihui/server && sb && cd ygg'
alias hg='cd ~/zaihui/hunger-game && sb && cd src'
alias blog='cd ~/self/zzzzzzmj.github.io'
alias cgd='hexo clean && hexo g && hexo d'
alias self='cd ~/self/ && ls'
alias zaihui='cd ~/zaihui && ls'
alias hes='cd ~/zaihui/hestia && pipenv shell'

# export
export PYENV_ROOT=/usr/local/var/pyenv
# export PIPENV_VENV_IN_PROJECT=1
# export WORKON_HOME='~/pipenv_env/'
