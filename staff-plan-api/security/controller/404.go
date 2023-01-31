package controller

import "net/http"

type NotFoundController struct{}

func NewNotFoundController() *NotFoundController {
	return &NotFoundController{}
}

func (c *NotFoundController) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotFound)
	w.Write([]byte("Resource not found"))
}
