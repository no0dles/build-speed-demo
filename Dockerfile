FROM node:8.1.3 as build

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY .angular-cli.json .
COPY tsconfig.json .
COPY src ./src

ARG ENV
RUN yarn build-$ENV

FROM nginx:latest
COPY --from=build /app/dist /usr/share/nginx/html
