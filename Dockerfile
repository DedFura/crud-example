FROM golang:1.20 as builder

WORKDIR /app
COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o .bin/app ./cmd

FROM alpine:latest
WORKDIR /root/

COPY --from=builder /app/.bin/app .
COPY --from=builder /app/config config/

EXPOSE 80

CMD ["./app"]
