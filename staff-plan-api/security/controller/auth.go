package controller

import (
	"encoding/json"
	"fmt"
	"net/http"
	"staff-plan-api/security/model"
	"staff-plan-api/security/repo"
	"staff-plan-api/security/util"
)

type AuthController struct {
	repo repo.IAuthRepo
}

func NewAuthController(repo repo.IAuthRepo) *AuthController {
	return &AuthController{repo}
}

func (c *AuthController) Login(w http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)
	dec.DisallowUnknownFields()
	var param model.AuthApiLoginParam

	if err := dec.Decode(&param); err != nil {
		util.LogErr(fmt.Sprintf("failed to parse request body: %s - %v", r.URL.Path, err))
		http.Error(w, "request is invalid", http.StatusInternalServerError)

	} else if err = param.Validate(); err != nil {
		util.LogErr(fmt.Sprintf("failed to validate request body: %s - %v", r.URL.Path, err))
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(err.(*model.ApiParamValidationError).M)

	} else if user, err := c.repo.FindUserByEmail(param.Email); err != nil {
		err := err.(*model.RepoError)
		http.Error(w, err.Msg, err.Code)

	} else if token, err := util.GenerateJWT(user.Email, user.Role); err != nil {
		util.LogErr(fmt.Sprintf("failed to generate token: %v", err))
		http.Error(w, "Oops! Something failed", http.StatusInternalServerError)

	} else {
		res := map[string]string{"access_token": token}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(res)
	}
}
