FROM node:18-alpine

RUN addgroup -S nodejs && adduser -S -G nodejs nodejs

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

CMD ["node", "index.js"]
