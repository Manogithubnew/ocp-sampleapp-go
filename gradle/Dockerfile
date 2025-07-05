# ------------ Stage 1: Build binary ------------
FROM golang:1.21-alpine AS builder

# Set Go environment variables
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Set working directory inside container
WORKDIR /app

# Copy go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go app and inject version via -ldflags
RUN go build -ldflags "-X main.version=1.0.1" -o hello-app

# ------------ Stage 2: Minimal final image ------------
FROM alpine:latest

# Create a non-root user for security
RUN adduser -D appuser

# Set working directory
WORKDIR /app
