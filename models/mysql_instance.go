package models

import (
	"fmt"
	"myAdmin/global"
)

type MysqlInstance struct {
	GModel
	Name          string                `json:"name" gorm:"type:varchar(30);comment:数据库昵称"`
	Addr          string                `json:"addr" gorm:"comment:连接地址"`
	Port          int                   `json:"port" gorm:"default:3306;comment:端口"`
	AdminUser     string                `json:"admin_user" gorm:"comment:管理账号"`
	AdminPassword string                `json:"admin_password" gorm:"comment:管理密码"`
	MonitorUser   string                `json:"monitor_user" gorm:"comment:监控账号"`
	MonitorPasswd string                `json:"monitor_passwd" gorm:"comment:监控密码"`
	Version       uint                  `json:"version" gorm:"comment:数据库版本"`
	Description   string                `json:"description" gorm:"comment:描述"`
	State         uint                  `json:"state" gorm:"index;desc;comment:运行状态"`
	Processlist   []Processlist         `gorm:"-"` //进程列表无需存入数据库
	Gvariable     []MysqlGlobalVariable `gorm:"-"`
}

func (i *MysqlInstance) GetOne() (err error) {
	if i.ID > 0 {
		return global.Db.First(&i, i.ID).Error
	}
	if len(i.Addr) > 0 {
		return global.Db.Where("addr = ? AND port = ?", i.Addr, i.Port).First(&i).Error
	}
	if len(i.Name) > 0 {
		return global.Db.Where("name = ?", i.Name).First(&i).Error
	}
	return fmt.Errorf("query parameter is empty")
}
