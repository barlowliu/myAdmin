package models

import (
	"gorm.io/gorm"
	"myAdmin/global"
	"time"
)

type GModel struct {
	ID        uint `gorm:"primarykey"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`
}

func Migrate() {
	global.Db.AutoMigrate(
		&MysqlInstance{},
		&MysqlUser{},
		&MysqlDB{},
	//&WorkflowNode{},
	//&WorkflowThread{},
	)
}
