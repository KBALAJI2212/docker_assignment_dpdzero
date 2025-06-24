FROM golang:latest as build

WORKDIR /app

COPY ./main.go ./main.go

RUN CGO_ENABLED=0 GOOS=linux go build -o service1 ./main.go


FROM alpine:latest

WORKDIR /app

COPY --from=build /app/service1 ./service1

CMD [ "./service1" ]