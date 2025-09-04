FROM node:20

WORKDIR /app

# Copy only the necessary files first
COPY package*.json ./
COPY prisma ./prisma

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the application files
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
