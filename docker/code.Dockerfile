FROM ackerr/devenv:base

WORKDIR /ackerr

COPY . ./dotfiles

# User Setting
RUN mkdir -p $HOME/.config/nvim && mv ./dotfiles/vim/* $HOME/.config/nvim/ && \
    mv ./dotfiles/gitconfig $HOME/.gitconfig && \
    mv ./dotfiles/editorconfig $HOME/.editorconfig && \
    mv ./dotfiles/profile $HOME/.profile && \
    mv ./dotfiles/p10k.zsh $HOME/.p10k.zsh && \
    mv ./dotfiles/zshrc $HOME/.zshrc

# Init zsh
# https://github.com/zdharma/zinit/issues/484
SHELL ["/bin/zsh", "-c"]

ARG TERM
ENV TERM=${TERM:-screen-256color} 
ENV POWERLEVEL9K_DISABLE_GITSTATUS=true
RUN zsh -isc "@zinit-scheduler burst"

# Init vim
RUN pip install pynvim && \
    npm install -g neovim && \
    nvim -E +PlugInstall +qall

ENTRYPOINT ["/bin/zsh"]
