FROM node:20

WORKDIR /app

COPY . .

# Install dependencies
RUN npm install --omit=dev

EXPOSE 3000

CMD ["npm", "start"]
