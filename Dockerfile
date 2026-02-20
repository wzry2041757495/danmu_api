FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --no-cache make git
RUN make deps && make build-all

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/build/meme-server .
CMD ["./meme-server"]
