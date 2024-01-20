# Build stage
FROM rust:latest AS builder
RUN apt-get update && apt-get install -y musl-tools && rm -rf /var/lib/apt/lists/* && rustup target add x86_64-unknown-linux-musl
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

# Runtime stage
FROM alpine
COPY --from=builder target/x86_64-unknown-linux-musl/release/docker_sample docker_sample
ENTRYPOINT ["./docker_sample"]
