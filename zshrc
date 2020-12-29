# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
typeset -g ZPLG_MOD_DEBUG=1

# plugins
zinit light skywind3000/z.lua

zinit ice lucid wait='1'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait='1' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

zinit ice lucid wait='1'
zinit light zsh-users/zsh-completions

zinit ice lucid wait='1'
zinit light paulirish/git-open

zinit ice lucid wait='1'
zinit light junegunn/fzf
zinit snippet "https://github.com/junegunn/fzf/blob/master/shell/completion.zsh"
zinit snippet "https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh"
zinit light Aloxaf/fzf-tab

# vi-mode
set -o vi
zle_highlight=(region:bg=yellow)  # highlight visual indication of the selected text
zinit ice lucid wait='1'
zinit light b4b4r07/zsh-vimode-visual
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# oh-my-zsh plugins
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

# p10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit ice depth=1
zinit light romkatv/powerlevel10k

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export BAT_THEME='Dracula'
export EDITOR='nvim'

# python
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

export SHELL='/bin/zsh'
export PATH="$HOME/.pyenv/bin:$PATH"

# go
[ -f ~/go-base ] && mkdir -p ~/go-base
export GOPATH="$HOME/go-base"
export PATH="$GOPATH:$GOPATH/bin:$PATH"
export GO111MODULE=on
export GOPROXY='https://goproxy.cn,direct'

# fzf
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
export FZF_DEFAULT_COMMAND="fd --exclude={'env,.git,.vscode,.idea,node_moudles,__pycache__'} --hidden --follow"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --pointer='▶' --marker='✓' --preview-window=:70% "
export FZF_PREVIEW_OPTS="--preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_CTRL_T_OPTS="$FZF_PREVIEW_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# alias
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
