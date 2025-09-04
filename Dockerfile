FROM node:20

ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

WORKDIR /app

COPY . .

# Install dependencies
RUN npm install --omit=dev

EXPOSE 3000

CMD ["npx", "tsx", "src/index.ts"]
