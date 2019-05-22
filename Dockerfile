FROM alpine:3.7
RUN apk add --no-cache openssh
RUN apk --update add sudo

RUN apk update && apk upgrade
RUN apk add nodejs
RUN rm -rf /var/cache/apk/*
COPY . /app
RUN cd /app; npm install

ENV PM_PORT 8080
ENV PM_HOST 0.0.0.0

EXPOSE 8080
CMD node /app/src/index.js