FROM alpine:3.7
RUN apk add --no-cache openssh
RUN apk --update add sudo

RUN apk update && apk upgrade
RUN apk add nodejs
RUN rm -rf /var/cache/apk/*
COPY . /app
RUN cd /app; npm install

ARG PM_PORT
ARG PM_HOST
ENV PM_PORT=${PM_PORT}
ENV PM_HOST=${PM_HOST}

EXPOSE 8080
CMD node /app/src/index.js