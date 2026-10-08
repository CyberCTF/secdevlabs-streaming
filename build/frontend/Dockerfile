# Upstream's deployments/frontend.dockerfile with these changes: the sources are copied from app/
# (upstream's app/frontend/); and the wait-for script (and the netcat it needs) is left out,
# since the machine starts only once the backend answers. nginx starts with the image's own
# command, as upstream's compose command does after waiting.
FROM docker.io/library/node:12.7-alpine as node

WORKDIR /app

COPY app/package.json app/package-lock.json /app/

RUN npm install

COPY app/ /app/

ARG env=prod

RUN npm run build

FROM docker.io/library/nginx:1.17.1-alpine

COPY --from=node /app/dist/streaming /usr/share/nginx/html

COPY app/nginx-custom.conf /etc/nginx/conf.d/default.conf
