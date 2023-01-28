package util

import (
	"log"
	"os"
)

func LogErr(err string) {
	log := log.New(os.Stderr, "ERROR: ", log.Ldate|log.Ltime)
	log.Println(err)
}

func LogInfo(msg string) {
	log := log.New(os.Stdout, "INFO: ", log.Ldate|log.Ltime)
	log.Println(msg)
}
