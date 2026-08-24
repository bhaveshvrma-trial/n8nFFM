FROM node:22-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        python3 \
        python3-pip \
        curl \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n@2.35.7 --unsafe-perm

# Re-enable Execute Command (needed to shell out to ffmpeg) — n8n 2.x disables it by default
ENV NODES_EXCLUDE=[]

# Only if you actually need external npm modules inside Code nodes:
# ENV NODE_FUNCTION_ALLOW_EXTERNAL=your,module,names

ENV N8N_PROTOCOL=http
WORKDIR /app
EXPOSE 5678
CMD ["sh", "-c", "n8n start --port ${PORT:-5678}"]
