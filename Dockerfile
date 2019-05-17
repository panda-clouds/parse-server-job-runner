FROM node:dubnium
LABEL maintainer "hello@pandaclouds.com"
ENV NODE_ENV=production
COPY . .
RUN npm install

CMD ["npm", "start"]
