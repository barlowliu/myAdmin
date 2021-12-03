package controllers

import "myAdmin/services"

// Profile 系统管理-个人资料
func (mi *MysqlInstanceController) Detail() {
	var settingService services.SettingService
	data := settingService.Show(1)

	mi.Data["data_config"] = data
	mi.Layout = "public/base.html"
	mi.TplName = "mysql_instance/detail.html"
}
