FROM node:24-slim AS base

# This will be set by the GitHub action to the folder containing this component.
ARG FOLDER=/app

# Install dependencies only when needed
FROM base AS deps

COPY . /app
WORKDIR ${FOLDER}

# Install dependencies based on the preferred package manager
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Create the node_modules directory if it still does not exist
RUN mkdir -p node_modules

# Rebuild the source code only when needed
FROM base AS builder
COPY . /app
WORKDIR ${FOLDER}
COPY --from=deps ${FOLDER}/node_modules ./node_modules

RUN \
  if [ -f yarn.lock ]; then yarn run build; \
  elif [ -f package-lock.json ]; then npm run build; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm run build; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Production image, copy all the files and run "npm start"
FROM base AS runner

COPY --from=builder --chown=1000:1000 /app /app
WORKDIR ${FOLDER}

ENV NODE_ENV=production

USER 1000:1000

EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["npm", "start"]
