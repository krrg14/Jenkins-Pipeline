FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules/ ./node_modules
COPY --from=builder /app/server.js ./server.js
COPY --from=builder /app/public ./public

EXPOSE 3000

CMD ["node", "server.js"]