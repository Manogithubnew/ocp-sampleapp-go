package main

import (
    "fmt"
    "net/http"
    "os"
)

// Default version (can be overridden at build time)
var version = "1.0.0"

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, World!")
    })

    http.HandleFunc("/version", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "App Version: %s\n", version)
    })

    port := getPort()
    fmt.Printf("Starting server on port %s...\n", port)
    http.ListenAndServe(":"+port, nil)
}

// getPort reads from env or defaults to 8080
func getPort() string {
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    return port
}
