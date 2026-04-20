FROM node:25-alpine

WORKDIR /app

RUN npm install -g bun

RUN apk add --no-cache git netcat-openbsd

COPY . .

RUN bun install

EXPOSE 3000
CMD ["sh", "-c", "bun db:migrate && bun run prod"]
