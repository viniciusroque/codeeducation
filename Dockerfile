FROM golang:alpine3.16 AS builder

WORKDIR /apps

RUN go mod init codeeducation

COPY . .

RUN go build -o hello.go


FROM alpine:latest
WORKDIR /apps
COPY --from=builder /apps/hello.go .
CMD ["./hello.go"]