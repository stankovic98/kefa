package main

import (
	"io/ioutil"
	"log"
	"net"
	"net/http"
	"time"
)

const (
	apiHost = "kefa:5000"
	apiURL  = "http://" + apiHost
)

func init() {
	for i := 0; i < 20; i++ {
		conn, err := net.DialTimeout("tcp", apiHost, time.Millisecond*100)
		if err == nil {
			log.Printf("API available at attempt %d", i+1)
			conn.Close()
			return
		}
		time.Sleep(time.Millisecond * 500)
	}
	log.Fatalf("Unable to connect to the API.")
}

func main() {
	start := time.Now()
	testPing()
	log.Printf("tests complited in %s\n", time.Now().Sub(start))
}

func testPing() {
	resp, err := http.Get(apiURL + "/ping")
	if err != nil {
		log.Fatalf("can't ping server: %v\n", err)
		return
	}
	defer resp.Body.Close()
	data, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("can't read response from ping: %v\n", err)
		return
	}
	if string(data) != "pong\n" {
		log.Fatalf("want %s, got %s\n", []byte("pong\\n"), data)
	}
}
