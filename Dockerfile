FROM node:12-slim

WORKDIR /usr/src/app

COPY . .

RUN npm install
RUN npm run build:ci

EXPOSE 9000
ENV OPENSHIFT_NODEJS_PORT 9000

CMD npm run start
