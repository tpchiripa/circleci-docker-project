FROM python:3.11-slim

# Install essential CI tools (IMPORTANT)
RUN apt-get update && apt-get install -y \
    bash \
    git \
    curl \
    openssh-client \
    tar \
    gzip \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project
COPY . .

# Make custom script executable
RUN chmod +x workdir/contacts

# CircleCI entrypoint preservation
LABEL com.circleci.preserve-entrypoint=true

# Default command
CMD ["bash"]