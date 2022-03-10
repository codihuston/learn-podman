FROM node:alpine

WORKDIR /app

COPY index.js .
COPY package.json .
COPY package-lock.json .

RUN npm install

CMD [ "npm", "run", "start"]