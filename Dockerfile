FROM node:20

WORKDIR /app

COPY . .

# Install dependencies
RUN npm install --omit=dev

# Apply Prisma migrations and seed the database
RUN npx prisma migrate deploy
RUN npx prisma db seed

EXPOSE 3000

CMD ["tsx", "src/index.ts"]
