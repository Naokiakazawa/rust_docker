FROM rust:latest
COPY . .
RUN cargo build --release
ENTRYPOINT ["./target/release/docker_sample"]