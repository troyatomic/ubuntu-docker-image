FROM ubuntu:latest
LABEL maintainer="Troy Dugger <troy@atomicrobot.com>"

RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg locales nodejs zsh wget vim nodejs npm fonts-powerline build-essential procps file git && \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:<a href="mailto://p@ssword1">p@ssword1</a>" | chpasswd &&  usermod -aG sudo devuser

ADD scripts/installthemes.sh /home/devuser/installthemes.sh

USER devuser
ENV TERM xterm
ENV ZSH_THEME agnoster
CMD ["zsh"]

