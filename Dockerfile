FROM klakegg/hugo:alpine AS build-env
WORKDIR /website
COPY . .
RUN hugo

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
COPY --from=build-env /website/public .