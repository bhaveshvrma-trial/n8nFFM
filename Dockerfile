# Stage 1: build n8n
FROM node:20-alpine AS builder

RUN apk add --no-cache git python3 make g++

WORKDIR /app

RUN npm install -g n8n@1.95.0

# Stage 2: runtime with FFmpeg
FROM node:20-alpine

RUN apk add --no-cache ffmpeg

WORKDIR /app

COPY --from=builder /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=builder /usr/local/bin/n8n /usr/local/bin/n8n

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["n8n", "start"]
