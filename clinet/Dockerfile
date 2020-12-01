FROM node:14.5.0-alpine

WORKDIR /usr/src/app_clinet

COPY ["./app/package.json", "./app/yarn.lock", "./"]

RUN npm install
ADD . /usr/src/app_clinet
