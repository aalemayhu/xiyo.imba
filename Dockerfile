FROM node:10.16.0-alpine
EXPOSE 8080 8080

ENV PGHOST "host.docker.internal"
WORKDIR /srv/xiyo.imba

COPY package.json /srv/xiyo.imba/
COPY yarn.lock /srv/xiyo.imba/

RUN yarn --frozen-lockfile

COPY . /srv/xiyo.imba

RUN yarn run build

CMD /srv/xiyo.imba/node_modules/.bin/imba main.imba