FROM node:20-alpine

RUN apk add --no-cache ffmpeg

RUN npm install -g n8n@1.95.0

WORKDIR /app

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["n8n", "start"]
