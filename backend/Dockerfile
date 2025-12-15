FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:22-alpine AS production

COPY --from=build /app /app

WORKDIR /app

RUN chown -R node:node /app
USER node

EXPOSE 8000

CMD [ "npm", "run", "dev" ]
