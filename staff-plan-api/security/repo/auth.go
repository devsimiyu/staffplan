package repo

import (
	"database/sql"
	"staff-plan-api/security/model"
)

type IAuthRepo interface {
	FindUserByEmail(string) (model.AuthRepoFindUserByEmailRes, error)
}

type authDbDao struct {
	db *sql.DB
}

func NewAuthDbDao(db *sql.DB) IAuthRepo {
	return &authDbDao{db}
}

func (dao *authDbDao) FindUserByEmail(email string) (user model.AuthRepoFindUserByEmailRes, err error) {
	return
}
