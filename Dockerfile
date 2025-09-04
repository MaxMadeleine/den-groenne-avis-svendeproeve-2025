FROM node:20

ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

WORKDIR /app

COPY . .

# Install dependencies
RUN npm install --omit=dev

# Apply Prisma migrations and seed the database
RUN echo "DATABASE_URL: $DATABASE_URL"
RUN npx prisma migrate deploy
RUN npx prisma db seed

EXPOSE 3000

CMD ["tsx", "src/index.ts"]
