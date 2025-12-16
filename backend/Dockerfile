FROM node:22-alpine AS build

RUN apk update

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:22-alpine AS production

COPY --from=build /app /app

WORKDIR /app

VOLUME [ "/app/static" ]

# RUN chown -R node:node /app
# USER node

EXPOSE 8000

CMD [ "npm", "run", "dev" ]
