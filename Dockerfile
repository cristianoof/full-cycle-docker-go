FROM golang:1.16.3-alpine3.13 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o dockergo main.go

FROM scratch
WORKDIR /root/
COPY --from=builder /app/dockergo .

CMD ["./dockergo"]
