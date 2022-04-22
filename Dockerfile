FROM golang:1.18-alpine AS builder
WORKDIR /usr/src/app
COPY . .
RUN go build -o /go/bin/fullcycle

FROM scratch
COPY --from=builder /go/bin/fullcycle /go/bin/fullcycle
ENTRYPOINT ["/go/bin/fullcycle"]