FROM node:8.1.3

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY .angular-cli.json .
COPY tsconfig.json .
COPY src ./src

RUN yarn build




FROM nginx:latest

COPY --from=0 /app/dist /usr/share/nginx/html
