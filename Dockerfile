FROM node:8

RUN npm install -g serve
ADD yarn.lock /yarn.lock
ADD package.json /package.json

ENV NODE_ENV=production
ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin
ENV NPM_CONFIG_LOGLEVEL warn

WORKDIR /app
ADD . /app

RUN yarn
RUN yarn build 


CMD serve -p 5000 -s /app/build

EXPOSE 5000
