FROM ubuntu

MAINTAINER Thiago Paes <mrprompt@gmail.com>

# substituindo a shell padrao
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# isntalando o essencial
RUN apt-get update
RUN apt-get install -y build-essential curl

# instalando NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
RUN source ~/.nvm/nvm.sh; \
	nvm install 6.2.2; \
	nvm use --delete-prefix 6.2.2; \
	npm i -g bower gulp forever

VOLUME ["/var/www"]

WORKDIR /var/www

