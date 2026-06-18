FROM golang:1.23-alpine AS build
WORKDIR /src
COPY . .
RUN go build -o /app/server main.go

FROM gcr.io/distroless/static-debian12
COPY --from=build /app/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]
