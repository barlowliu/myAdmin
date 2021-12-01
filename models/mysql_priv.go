package models

//MysqlUser 数据库实例用户基本信息及全局权限
type MysqlUser struct {
	GModel
	InstanceID uint `json:"instance_id" gorm:"uniqueIndex:idx_insID_HostUser,comment:关联实例ID"`
	//Instance   MysqlInstance `gorm:"foreignKey:InstanceID"`
	User string `json:"user" gorm:"uniqueIndex:idx_insID_HostUser,comment:用户名"`
	Data string `gorm:"type:json"`
}

//MysqlDB 数据库级别权限
type MysqlDB struct {
	GModel
	InstanceID uint `json:"instance_id" gorm:"uniqueIndex:idx_Db_HostUser,comment:关联实例ID"`
	//Instance   MysqlInstance `gorm:"foreignKey:InstanceID"`
	Db   string `json:"db" gorm:"uniqueIndex:idx_Db_HostUser,comment:数据库"`
	User string `json:"user" gorm:"uniqueIndex:idx_Db_HostUser,comment:用户名"`
	Data string `gorm:"type:json"`
}
