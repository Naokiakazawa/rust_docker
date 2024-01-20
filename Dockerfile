# Build stage
FROM rust:latest AS builder
COPY . .
RUN cargo build --release

# Runtime stage
FROM debian
COPY --from=builder /target/release/docker_sample docker_sample
ENTRYPOINT ["./docker_sample"]
