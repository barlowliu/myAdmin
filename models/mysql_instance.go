package models

type MysqlInstance struct {
	ID            int    `orm:"column(id);auto;size(11);description(主键ID)"" json:"id"`
	Name          string `json:"name" orm:"description(数据库昵称)"`
	Addr          string `json:"addr" orm:"description(连接地址)"`
	Port          int    `json:"port" orm:"default(3306);description(数据库端口)"`
	AdminUser     string `json:"admin_user" orm:"description(管理账号)"`
	AdminPassword string `json:"admin_password" orm:"description(管理密码)"`
	MonitorUser   string `json:"monitor_user" orm:"description(监控账号)"`
	MonitorPasswd string `json:"monitor_passwd" orm:"description(监控密码)"`
	Version       uint   `json:"version" orm:"description(数据库版本)"`
	Description   string `json:"description" orm:"description(描述)"`
	State         int    `json:"state" orm:"description(运行状态)"`
	CreateTime    int    `orm:"column(create_time);size(10);default(0)" description:"操作时间" json:"create_time"`
	UpdateTime    int    `orm:"column(update_time);size(10);default(0)" description:"更新时间" json:"update_time"`
	DeleteTime    int    `orm:"column(delete_time);;size(10);default(0)" description:"删除时间" json:"delete_time"`
	//Processlist   []Processlist         `orm:"-"` //进程列表无需存入数据库
	//Gvariable     []MysqlGlobalVariable `orm:"-"`
}

// TableName 自定义table 名称
func (*MysqlInstance) TableName() string {
	return "mysql_instance"
}

// 多字段唯一键
func (u *MysqlInstance) TableUnique() [][]string {
	return [][]string{
		[]string{"addr", "port"},
	}
}

// NoDeletionId 禁止删除的数据id
func (*MysqlInstance) NoDeletionId() []int {
	return []int{}
}

// SearchField 定义模型的可搜索字段
func (*MysqlInstance) SearchField() []string {
	return []string{"name", "addr"}
}

// WhereField 定义模型可作为条件的字段
func (*MysqlInstance) WhereField() []string {
	return []string{}
}

// TimeField 定义可做为时间范围查询的字段
func (*MysqlInstance) TimeField() []string {
	return []string{}
}
