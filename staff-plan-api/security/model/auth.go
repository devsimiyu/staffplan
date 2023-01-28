package model

import (
	"net/mail"
	"time"
)

type AuthApiLoginParam struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func (p *AuthApiLoginParam) Validate() (err error) {
	v := &ApiParamValidationError{M: make(map[string]interface{})}

	v.RLock()
	defer v.RUnlock()

	if p.Email == "" {
		v.M["email"] = "email is required"

	} else if _, err = mail.ParseAddress(p.Email); err != nil {
		v.M["email"] = "email must be valid"
	}
	if p.Password == "" {
		v.M["password"] = "password is required"
	}
	if len(v.M) > 0 {
		err = v
	}
	return
}

type AuthRepoFindUserByEmailRes struct {
	Email     string
	Password  string
	Role      int
	DeletedAt time.Time
}
