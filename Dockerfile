FROM node:12.22.12-alpine3.15

RUN apk add --no-cache python2 build-base


WORKDIR /app
COPY app .
RUN yarn install --production

CMD ["node", "/app/src/index.js"]
