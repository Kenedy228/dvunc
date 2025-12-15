FROM node:22-alpine

ENV PORT=8000
ENV DB_NAME=postgres
ENV DB_USER=postgres
ENV DB_PASSWORD=4085562
ENV DB_HOST=dvunc-db
ENV DB_PORT=5432
ENV SECRET_KEY=vesna45

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8000

CMD [ "npm", "run", "dev" ]
