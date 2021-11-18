package models

type Database struct {
	GModel
	Name          string `json:"name" gorm:"type:varchar(30);comment:数据库昵称"`
	Addr          string `json:"addr" gorm:"comment:连接地址"`
	Port          int    `json:"port" gorm:"端口"`
	AdminUser     string `json:"admin_user" gorm:"comment:管理账号"`
	AdminPassword []byte `json:"admin_password" gorm:"comment:管理密码"`
	MonitorUser   string `json:"monitor_user" gorm:"comment:监控账号"`
	MonitorPasswd []byte `json:"monitor_passwd" gorm:"comment:监控密码"`
	Version       uint   `json:"version" gorm:"comment:数据库版本"`
	Description   string `json:"description" gorm:"comment:描述"`
	State         uint   `json:"state" gorm:"index;desc;comment:运行状态"`
}
