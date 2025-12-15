FROM node:25-alpine AS build
ENV REACT_APP_BACKEND_SCHEMA=http
ENV REACT_APP_BACKEND_HOST=localhost
ENV REACT_APP_BACKEND_PORT=8000
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine AS production
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 3000
CMD [ "nginx", "-g", "daemon off;" ]
