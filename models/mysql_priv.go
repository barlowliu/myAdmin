package models

import "time"

//MysqlUser 数据库实例用户基本信息及全局权限
type MysqlUser struct {
	GModel
	InstanceID           int           `json:"instance_id" gorm:"comment:关联实例ID"`
	Instance             MysqlInstance `gorm:"foreignKey:InstanceID"`
	Host                 string        `json:"host" gorm:"comment:客户端Host"`
	User                 string        `json:"user" gorm:"comment:用户名"`
	SelectPriv           string
	InsertPriv           string
	UpdatePriv           string
	DeletePriv           string
	CreatePriv           string
	DropPriv             string
	ReloadPriv           string
	ShutdownPriv         string
	ProcessPriv          string
	FilePriv             string
	GrantPriv            string
	ReferencesPriv       string
	IndexPriv            string
	AlterPriv            string
	ShowDbPriv           string
	SuperPriv            string
	CreateTmpTablePriv   string
	Lock_tablesPriv      string
	ExecutePriv          string
	ReplSlavePriv        string
	ReplClientPriv       string
	CreateViewPriv       string
	ShowViewPriv         string
	CreateRoutinePriv    string
	AlterRoutinePriv     string
	CreateUserPriv       string
	EventPriv            string
	TriggerPriv          string
	CreateTablespacePriv string
	SslType              string
	SslCipher            []byte
	X509Issuer           []byte
	X509Subject          []byte
	MaxQuestions         int
	MaxUpdates           int
	MaxConnections       int
	MaxUserConnections   int
	Plugin               string
	AuthenticationString string
	PasswordExpired      string
	PasswordLast_changed time.Time
	PasswordLifetime     time.Time
	AccountLocked        string
}

//MysqlDB 数据库级别权限
type MysqlDB struct {
	GModel
	InstanceID         int           `json:"instance_id" gorm:"comment:关联实例ID"`
	Instance           MysqlInstance `gorm:"foreignKey:InstanceID"`
	Host               string        `json:"host" gorm:"comment:客户端Host"`
	Db                 string        `json:"db" gorm:"comment:数据库"`
	User               string        `json:"user" gorm:"comment:用户名"`
	SelectPriv         string
	InsertPriv         string
	UpdatePriv         string
	DeletePriv         string
	CreatePriv         string
	DropPriv           string
	GrantPriv          string
	ReferencesPriv     string
	IndexPriv          string
	AlterPriv          string
	CreateTmpTablePriv string
	LockTablesPriv     string
	CreateViewPriv     string
	ShowViewPriv       string
	CreateRoutinePriv  string
	AlterRoutinePriv   string
	ExecutePriv        string
	EventPriv          string
	TriggerPriv        string
}
