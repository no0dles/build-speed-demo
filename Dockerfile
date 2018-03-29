FROM node:8.1.3

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY .angular-cli.json .
COPY tsconfig.json .
COPY src ./src

ARG ENV
RUN yarn build-$ENV

FROM fholzer/nginx-brotli:latest
EXPOSE 80
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# COPY --from=0 /app/dist /usr/share/nginx/html
