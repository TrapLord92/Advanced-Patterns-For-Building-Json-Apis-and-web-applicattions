# Use an official Go image as the builder
FROM golang:1.23-alpine3.20 AS go-builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files first for caching dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Final stage
FROM golang:1.23-alpine3.20

# Set the working directory for the final image
WORKDIR /app

# Copy the source code from the builder
COPY --from=go-builder /app .

# Expose the application port
EXPOSE 4000

# Run the Go application using shell form to allow variable expansion
CMD ["sh", "-c", "go run ./cmd/api -db-dsn=${GREENLIGHT_DB_DSN}"]
