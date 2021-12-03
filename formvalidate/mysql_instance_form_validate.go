package formvalidate

import "github.com/gookit/validate"

// AdminUserForm admin_user 表单
type MysqlInstanceForm struct {
	ID              int    `form:"id"`
	Name            string `form:"name" validate:"required"`
	Addr            string `form:"addr" validate:"required"`
	Port            int    `form:"port" validate:"required"`
	AdminUser       string `form:"admin_user" validate:"required"`
	AdminPassword   string `form:"admin_password" validate:"required"`
	MonitorUser     string `form:"monitor_user"`
	MonitorPassword string `form:"monitor_password"`
	Description     string `form:"description"`
	State           int    `form:"state"`
	IsCreate        int    `form:"_create"`
}

// Messages 自定义验证返回消息
func (f MysqlInstanceForm) Messages() map[string]string {
	return validate.MS{
		"Name.required":          "请填写数据库名称.",
		"Addr.required":          "请填写数据库连接地址.",
		"Port.required":          "请填写数据库连接端口.",
		"AdminUser.required":     "请填写管理账号.",
		"AdminPassword.required": "请填写管理密码.",
	}
}
