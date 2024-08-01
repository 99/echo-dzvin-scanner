# FROM rust:latest
# WORKDIR /code

# COPY . .

# RUN cargo build --release
# EXPOSE 8080

# CMD ["./target/release/echo-dzvin-scanner"]


FROM rust:latest as builder

WORKDIR /code
COPY . .

RUN cargo build --release

FROM debian:buster-slim

WORKDIR /app

COPY --from=builder /code/target/release/echo-dzvin-scanner .

EXPOSE 8080

CMD ["./echo-dzvin-scanner"]
