FROM ubuntu:latest
LABEL maintainer="Troy Dugger <troy@atomicrobot.com>"

RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg locales zsh wget vim git && \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:<a href="mailto://p@ssword1">p@ssword1</a>" | chpasswd &&  usermod -aG sudo devuser

# Install a more recent version of NodeJS
# found this at https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh && \
    chmod 755 /tmp/nodesource_setup.sh && \
    /tmp/nodesource_setup.sh && \
    apt remove -y nodejs npm && \
    apt-get install -y nodejs

USER devuser
WORKDIR /develop
RUN git clone https://github.com/troyatomic/expressjs-typescript
WORKDIR /develop/expressjs-typescript
RUN npm ci

ENV SERVER_PORT 8080
CMD ["npm", "run", "start"]
