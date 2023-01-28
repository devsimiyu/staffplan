package main

import (
	"fmt"
	"net/http"
	"os"
	"staff-plan-api/security/controller"
	"staff-plan-api/security/repo"
	"staff-plan-api/security/util"
	database "staff-plan-db"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/awslabs/aws-lambda-go-api-proxy/httpadapter"
	_ "github.com/joho/godotenv/autoload"
)

func main() {
	db, err := database.NewConnection()
	if err != nil {
		util.LogErr(fmt.Sprintf("failed to create database pool: %v", err))
		os.Exit(1)

	} else if err := db.Ping(); err != nil {
		util.LogErr(fmt.Sprintf("failed to ping database: %v", err))
		os.Exit(1)
	}
	defer db.Close()

	authRepo := repo.NewAuthDbDao(db)
	authController := controller.NewAuthController(authRepo)
	healthController := controller.NewHealthController()

	http.HandleFunc("/api/security/login", authController.Login)
	http.Handle("/api/security/health", healthController)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { w.Write([]byte("Resource not found")) })

	if _, ok := os.LookupEnv("IS_LAMBDA"); ok {
		util.LogInfo("launching lambda function")
		lambda.Start(httpadapter.New(http.DefaultServeMux).ProxyWithContext)

	} else {
		port := os.Getenv("PORT")
		if port == "" {
			port = "8000"
		}

		util.LogInfo(fmt.Sprintf("launching server on port %s", port))
		err := http.ListenAndServe(":"+port, nil)
		util.LogErr(fmt.Sprintf("server shutdown: %v", err))
	}
}
