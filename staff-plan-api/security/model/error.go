package model

import (
	"fmt"
	"sync"
)

type ApiParamValidationError struct {
	sync.RWMutex
	M map[string]interface{}
}

func (e *ApiParamValidationError) Error() string {
	return fmt.Sprint(e.M)
}

type RepoError struct {
	Code int
	Msg  string
}

func (e *RepoError) Error() string {
	return fmt.Sprintf("(%d) %s", e.Code, e.Msg)
}
