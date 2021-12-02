package controllers

import (
	"github.com/gookit/validate"
	"myAdmin/formvalidate"
	"myAdmin/global"
	"myAdmin/global/response"
	"myAdmin/services"
)

type MysqlInstance struct {
	baseController
}

func (mi *MysqlInstance) Index() {
	var mysqlInstanceService services.MySQLInstanceService
	data, pagination := mysqlInstanceService.GetPaginateData(admin["per_page"].(int), gQueryParams)
	mi.Data["data"] = data
	mi.Data["paginate"] = pagination

	mi.Layout = "public/base.html"
	mi.TplName = "mysql_instance/index.html"
}

// Add MySQL实例-添加界面
func (uc *MysqlInstance) Add() {
	uc.Layout = "public/base.html"
	uc.TplName = "mysql_instance/add.html"
}

// Create 添加用户
func (uc *MysqlInstance) Create() {
	var mysqlInstanceForm formvalidate.MysqlInstanceForm
	if err := uc.ParseForm(&mysqlInstanceForm); err != nil {
		response.ErrorWithMessage(err.Error(), uc.Ctx)
	}

	v := validate.Struct(mysqlInstanceForm)

	if !v.Validate() {
		response.ErrorWithMessage(v.Errors.One(), uc.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService
	insertID := mysqlInstanceService.Create(&mysqlInstanceForm)

	url := global.URL_BACK
	if mysqlInstanceForm.IsCreate == 1 {
		url = global.URL_RELOAD
	}

	if insertID > 0 {
		response.SuccessWithMessageAndUrl("添加成功", url, uc.Ctx)
	} else {
		response.Error(uc.Ctx)
	}
}
