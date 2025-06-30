FROM alpine:latest

ARG PB_VERSION=0.28.3

# Install unzip and curl
RUN apk add --no-cache unzip curl ca-certificates

# Set working directory
WORKDIR /app

# Download PocketBase
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip

# Copy existing pb_data folder (with your data)
COPY pb_data /pb_data

# Expose port 8090
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--dir", "/pb_data", "--listen", "0.0.0.0:8090"]
