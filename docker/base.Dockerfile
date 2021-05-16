FROM library/ubuntu:20.04

WORKDIR /ackerr

# Install Tool
RUN echo "Asia/Shanghai" > /etc/timezone && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get -y install make git net-tools wget curl zsh python3.8

# Install neovim-nightly
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage &&\
    chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && rm ./nvim.appimage && \
    mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install golang
RUN wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz


COPY . ./

RUN  mkdir -p $HOME/.config/nvim && mv ./vim/ $HOME/.config/nvim/ && \
     mv ./gitconfig $HOME/.gitconfig && \
     mv ./editorconfig $HOME/.editorconfig && \
     mv ./profile $HOME/.profile && \
     mv ./p10k.zsh $HOME/.p10k.zsh && \
     mv ./zshrc $HOME/.zshrc
