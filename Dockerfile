FROM golang:1.21.3

WORKDIR /app

COPY go.mod go.sum tracker.db ./

RUN go mod download

COPY *.go ./

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /db_app

CMD ["/db_app"]
