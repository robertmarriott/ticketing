FROM node:20-bookworm-slim

ENV NODE_ENV=production

ENV PORT 3000
EXPOSE ${PORT}

USER node

WORKDIR /app

COPY package*.json ./

RUN npm ci && npm cache clean --force

COPY --chown=node:node . .

CMD ["npm", "start"]
