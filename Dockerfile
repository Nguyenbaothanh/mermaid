FROM node:22.12.0-alpine3.19

USER 0:0

# Enable pnpm/yarn nếu cần
RUN corepack enable && corepack enable pnpm

# Cài git + mermaid-cli
RUN apk add --no-cache git \
    && git config --add --system safe.directory /mermaid \
    && npm install -g @mermaid-js/mermaid-cli \
    && which mmdc \
    && mmdc --version

# Tăng memory limit cho Node
ENV NODE_OPTIONS="--max_old_space_size=8192"

WORKDIR /app

EXPOSE 9000 3333

# Default entrypoint
ENTRYPOINT ["mmdc"]
