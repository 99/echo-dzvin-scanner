# FROM rust:latest
# WORKDIR /code

# COPY . .

# RUN cargo build --release
# EXPOSE 8080

# CMD ["./target/release/echo-dzvin-scanner"]


# FROM rust:latest as builder
FROM rust:1.78.0 as builder

WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock ./
COPY src ./src

RUN cargo build --release
FROM debian:buster-slim

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/target/release/echo-dzvin-scanner .

ENV RUST_LOG=info
EXPOSE 8080

CMD ["./echo-dzvin-scanner"]
