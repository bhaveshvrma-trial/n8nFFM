FROM docker.n8n.io/n8nio/n8n:1.95.0

USER root

RUN apk add --no-cache ffmpeg

USER node
