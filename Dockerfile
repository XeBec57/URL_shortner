FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod ./

COPY main.go ./

RUN go build -o url-shortener main.go


FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/url-shortener .

COPY static ./static

EXPOSE 8080

CMD ["./url_shortener"]