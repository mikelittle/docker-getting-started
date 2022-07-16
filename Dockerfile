FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
# Adding build tools to make yarn install work on Apple silicon / arm64 machines
RUN apk add --no-cache python2 g++ make
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]
