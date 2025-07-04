# -------- Stage 1: Build the Go binary --------
FROM golang:1.21-alpine AS builder

# Enable static linking
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

# Copy go.mod and go.sum first for dependency caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the binary with version injection
RUN go build -ldflags "-X main.version=1.0.1" -o hello-app

# -------- Stage 2: Create lightweight runtime image --------
FROM alpine:latest

# Create a non-root user for security
RUN adduser -
