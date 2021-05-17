FROM ackerr/devenv:base

WORKDIR /ackerr

COPY . ./dotfiles

RUN mkdir -p $HOME/.config/nvim && mv ./dotfiles/vim/* $HOME/.config/nvim/ && \
    mv ./dotfiles/gitconfig $HOME/.gitconfig && \
    mv ./dotfiles/editorconfig $HOME/.editorconfig && \
    mv ./dotfiles/profile $HOME/.profile && \
    mv ./dotfiles/p10k.zsh $HOME/.p10k.zsh && \
    mv ./dotfiles/zshrc $HOME/.zshrc && \
    nvim +PlugInstall +qall && \
    pip install pynvim && \
    npm install -g neovim
