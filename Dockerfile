FROM alpine:3.7
RUN apk add --no-cache openssh
RUN apk --update add sudo

RUN apk update && apk upgrade
RUN apk add nodejs
RUN rm -rf /var/cache/apk/*
COPY . /app
RUN cd /app; npm install

EXPOSE 8080