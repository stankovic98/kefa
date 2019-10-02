package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

var (
	from       = "antoniostankovic@gmail.com"
	msg        = []byte("dummy message")
	recipients = []string{"antoniostankovich@gmail.com"}
)

func main() {
	port := getEnv("PORT")
	http.HandleFunc("/ping", ping)
	log.Printf("Web Server Started at " + port)
	log.Fatalln(http.ListenAndServe(port, nil))
}

func ping(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "pong")
}

func getEnv(key string) string {
	env, ok := os.LookupEnv(key)
	if ok {
		return env
	}
	switch key {
	case "PORT":
		env = ":5000"
	}
	return env
}
