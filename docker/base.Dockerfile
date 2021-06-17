FROM library/ubuntu:20.04

WORKDIR /tmp

# Fix something
RUN apt-get update && apt-get -y upgrade && \
    echo "Asia/Shanghai" > /etc/timezone && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata && \
    apt-get install -y locales && locale-gen en_US.UTF-8

# Install Tool
RUN apt-get install -y zsh && chsh -s /bin/zsh && \
    apt-get install -y fd-find && \
    ln -s $(which fdfind) /usr/local/bin/fd && \
    apt-get install -y make git net-tools wget curl gcc htop ripgrep lua5.2 ranger tmux

# Install neovim-nightly
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage &&\
    chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && rm ./nvim.appimage && \
    mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install Python
RUN apt-get install -y pip python3.8 && \
    ln -s $(which python3) /usr/local/bin/python

# Install Nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    npm config set registry https://registry.npm.taobao.org

# Install Golang
RUN wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz && \
    cp /usr/local/go/bin/* /usr/local/bin/
