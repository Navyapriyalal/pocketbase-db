FROM alpine:latest

ARG PB_VERSION=0.28.3

RUN apk add --no-cache unzip curl ca-certificates

WORKDIR /app

RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip

COPY pb_data /pb_data

ENV PB_ADDR=0.0.0.0:8090

EXPOSE 8090

CMD ["./pocketbase", "serve", "--dir", "/pb_data"]
