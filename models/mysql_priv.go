package models

//MysqlUser 数据库实例用户基本信息及全局权限
type MysqlUser struct {
	ID         int `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	InstanceID int `json:"instance_id" gorm:"uniqueIndex:idx_insID_HostUser,comment:关联实例ID"`
	//Instance   MysqlInstance `gorm:"foreignKey:InstanceID"`
	User       string `json:"user" gorm:"uniqueIndex:idx_insID_HostUser,comment:用户名"`
	Data       string `gorm:"type:json"`
	CreateTime int    `orm:"column(create_time);size(10);default(0)" description:"操作时间" json:"create_time"`
	UpdateTime int    `orm:"column(update_time);size(10);default(0)" description:"更新时间" json:"update_time"`
	DeleteTime int    `orm:"column(delete_time);;size(10);default(0)" description:"删除时间" json:"delete_time"`
}

//MysqlDB 数据库级别权限
type MysqlDB struct {
	ID         int `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	InstanceID int `json:"instance_id" gorm:"uniqueIndex:idx_Db_HostUser,comment:关联实例ID"`
	//Instance   MysqlInstance `gorm:"foreignKey:InstanceID"`
	Db         string `json:"db" gorm:"uniqueIndex:idx_Db_HostUser,comment:数据库"`
	User       string `json:"user" gorm:"uniqueIndex:idx_Db_HostUser,comment:用户名"`
	Data       string `gorm:"type:json"`
	CreateTime int    `orm:"column(create_time);size(10);default(0)" description:"操作时间" json:"create_time"`
	UpdateTime int    `orm:"column(update_time);size(10);default(0)" description:"更新时间" json:"update_time"`
	DeleteTime int    `orm:"column(delete_time);;size(10);default(0)" description:"删除时间" json:"delete_time"`
}
