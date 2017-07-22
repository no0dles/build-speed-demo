FROM node:8.1.3

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY .angular-cli.json .
COPY tsconfig.json .
COPY src ./src


FROM node:8.1.3 as dev-build
RUN yarn build-dev

FROM node:8.1.3 as staging-build
RUN yarn build-staging

FROM node:8.1.3 as prod-build
RUN yarn build-prod


FROM nginx:latest as dev
COPY --from=dev-build /app/dist /usr/share/nginx/html

FROM nginx:latest as staging
COPY --from=staging-build /app/dist /usr/share/nginx/html

FROM nginx:latest as prod
COPY --from=prod-build /app/dist /usr/share/nginx/html
