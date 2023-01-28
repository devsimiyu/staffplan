package util

import (
	"errors"
	"fmt"
	"os"
	"time"

	"github.com/golang-jwt/jwt"
)

var secret = []byte(os.Getenv("JWT_SECRET"))

func GenerateJWT(sub string, role int) (string, error) {
	token := jwt.New(jwt.SigningMethodHS256)
	claims := token.Claims.(jwt.MapClaims)
	claims["sub"] = sub
	claims["role"] = role
	claims["exp"] = time.Now().Add(time.Hour * 720).Unix()
	claims["iss"] = time.Now().Unix()
	return token.SignedString(secret)
}

func ParseJWT(value string) (jwt.MapClaims, error) {
	token, err := jwt.Parse(value, func(t *jwt.Token) (res interface{}, err error) {
		if _, ok := t.Method.(*jwt.SigningMethodHMAC); ok {
			res, err = secret, nil

		} else {
			res, err = nil, fmt.Errorf("unexpected signing method: %v", t.Header["alg"])
		}
		return
	})
	if err != nil || !token.Valid {
		return nil, err
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		err = errors.New("failed to extract claims from token")
	}
	return claims, err
}
