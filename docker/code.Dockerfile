FROM ackerr/ackerr:base

ENV HOME /root
ENV GOPATH $HOME/go-base

WORKDIR $HOME

COPY . ./dotfiles

# User Setting
RUN mkdir -p $HOME/.config/nvim $HOME/.config/coc/extensions && \
    mv ./dotfiles/vim/coc-extensions.json $HOME/.config/coc/extensions/package.json && \
    mv ./dotfiles/vim/* $HOME/.config/nvim/ && \
    mv ./dotfiles/gitconfig $HOME/.gitconfig && \
    mv ./dotfiles/editorconfig $HOME/.editorconfig && \
    mv ./dotfiles/profile $HOME/.profile && \
    mv ./dotfiles/p10k.zsh $HOME/.p10k.zsh && \
    mv ./dotfiles/zshrc $HOME/.zshrc

# Init zsh
# https://github.com/zdharma/zinit/issues/484
# https://github.com/romkatv/powerlevel10k/issues/949
SHELL ["/bin/zsh", "-c"]

ENV TERM=${TERM:-xterm-256color} 
RUN zsh -isc "@zinit-scheduler burst"
RUN script -qec "zsh -is </dev/null" /dev/null 

# Init vim
RUN pip install pynvim && \
    npm install -g neovim yarn && \
    nvim -E +PlugInstall +qall && \
    cd $HOME/.config/coc/extensions/ && yarn install

ENTRYPOINT ["/bin/zsh"]
