FROM library/ubuntu:20.04

WORKDIR /tmp

# Install Tool
RUN echo "Asia/Shanghai" > /etc/timezone && \
    apt-get update && apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
    apt-get -y install make git net-tools wget curl zsh gcc htop

# Install neovim-nightly
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage &&\
    chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && rm ./nvim.appimage && \
    mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install Python
RUN apt-get install -y pip python3.8

# Install Nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs

# Install Golang
RUN wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz && \
    cp /usr/local/go/bin/* /usr/local/bin/
