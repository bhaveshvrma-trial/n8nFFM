FROM node:20-alpine

# Install FFmpeg and Python
RUN apk add --no-cache ffmpeg python3 py3-pip

# Install n8n
RUN npm install -g n8n@2.35.7

# Enable Execute Command and Code nodes
ENV N8N_RUNNERS_ENABLED=true
ENV EXECUTE_COMMAND_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=true

WORKDIR /app

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["n8n", "start"]
