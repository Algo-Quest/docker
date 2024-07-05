FROM node:20
WORKDIR /app
COPY package*.json ./
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm i
# omit devDeps while installing on production server
# RUN npm ci --omit=dev
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
