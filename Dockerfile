FROM node:lts-alpine3.12
LABEL Maintainer="colinb969@gmail.com"

# Installing GIT
RUN apk update && apk add git

# Installing Yeoman and VS Code Extension Generator globally
RUN npm install -g yo generator-fpl
RUN chown -R node:node /usr/local/lib/node_modules

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

RUN chown -R node:node /usr/src/app
USER node
ENTRYPOINT [ "yo", "fpl" ]