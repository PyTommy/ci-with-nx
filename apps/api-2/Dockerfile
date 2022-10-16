FROM node:16-alpine
WORKDIR /app

COPY ./dist/apps/api-2 ./dist/apps/api-2

ENV PORT=${8080}
EXPOSE ${8080}

COPY ./dist/apps/api-2/package.json .
RUN npm i --production

CMD node ./dist/apps/api-2/main.js