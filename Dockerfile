FROM node:22

RUN apt-get update \
    && apt-get install -y --no-install-recommends socat git \
    && rm -rf /var/lib/apt/lists/*

RUN corepack enable \
    && corepack prepare pnpm@latest --activate

WORKDIR /app

RUN git clone https://github.com/skabdulhaq/deepseek-harness .

RUN pnpm install
RUN pnpm run build

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3080

ENTRYPOINT ["/entrypoint.sh"]
