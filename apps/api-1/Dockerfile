FROM node:16-alpine
WORKDIR /app

COPY ./dist/apps/api-1 ./dist/apps/api-1

ENV PORT=${8080}
EXPOSE ${8080}

COPY ./dist/apps/api-1/package.json .
RUN npm i --production

CMD node ./dist/apps/api-1/main.js