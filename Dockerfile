FROM node:22.12.0-alpine3.19@sha256:40dc4b415c17b85bea9be05314b4a753f45a4e1716bb31c01182e6c53d51a654

USER 0:0

# Bật corepack (yarn/pnpm) nếu bạn cần
RUN corepack enable && corepack enable pnpm

# Cài git và mermaid-cli
RUN apk add --no-cache git \
    && git config --add --system safe.directory /mermaid \
    && npm install -g @mermaid-js/mermaid-cli

# Tăng memory limit cho Node
ENV NODE_OPTIONS="--max_old_space_size=8192"

# Set working dir
WORKDIR /app

# Expose port (chỉ cần nếu bạn chạy service khác, mmdc không cần port)
EXPOSE 9000 3333

# Default entrypoint là mermaid-cli
ENTRYPOINT ["mmdc"]
