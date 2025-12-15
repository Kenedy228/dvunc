FROM node:25-alpine AS build

RUN apk update && apk add --no-cache optipng jpegoptim \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN find public -name "*.png" -exec optipng -o7 {} \;
RUN find public -name "*.jpg" -exec jpegoptim --strip-all --max=85 {} \;
RUN find src/img -name "*.png" -exec optipng -o7 {} \;
RUN find src/img -name "*.jpg" -exec jpegoptim --strip-all --max=85 {} \;

RUN npm run build

FROM nginx:stable-alpine AS production
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 3000
CMD [ "nginx", "-g", "daemon off;" ]
