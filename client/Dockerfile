FROM node:14.5.0-alpine

WORKDIR /usr/src/client

COPY ["./package.json", "./package-lock.json", "./"]

RUN npm install

ADD . ./

RUN npm run build