package controllers

import (
	"fmt"
	"github.com/adam-hanna/arrayOperations"
	"github.com/gookit/validate"
	"myAdmin/formvalidate"
	"myAdmin/global"
	"myAdmin/global/response"
	"myAdmin/models"
	"myAdmin/services"
	"myAdmin/utils"
	"strconv"
	"strings"
)

type MysqlInstanceController struct {
	baseController
}

func (mi *MysqlInstanceController) Index() {
	var mysqlInstanceService services.MySQLInstanceService
	data, pagination := mysqlInstanceService.GetPaginateData(admin["per_page"].(int), gQueryParams)
	mi.Data["data"] = data
	mi.Data["paginate"] = pagination

	mi.Layout = "public/base.html"
	mi.TplName = "mysql_instance/index.html"
}

// Add MySQL实例-添加界面
func (mi *MysqlInstanceController) Add() {
	mi.Layout = "public/base.html"
	mi.TplName = "mysql_instance/add.html"
}

// Create 添加用户
func (mi *MysqlInstanceController) Create() {
	var mysqlInstanceForm formvalidate.MysqlInstanceForm
	if err := mi.ParseForm(&mysqlInstanceForm); err != nil {
		response.ErrorWithMessage(err.Error(), mi.Ctx)
	}

	v := validate.Struct(mysqlInstanceForm)

	if !v.Validate() {
		response.ErrorWithMessage(v.Errors.One(), mi.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService
	insertID, err := mysqlInstanceService.Create(&mysqlInstanceForm)

	url := global.URL_BACK
	if mysqlInstanceForm.IsCreate == 1 {
		url = global.URL_RELOAD
	}

	if insertID > 0 {
		response.SuccessWithMessageAndUrl("添加成功", url, mi.Ctx)
	} else if err != nil {
		response.ErrorWithMessage(fmt.Sprintf("添加失败，错误为：%s", err.Error()), mi.Ctx)
	}
}

// Edit 用户-修改界面
func (mi *MysqlInstanceController) Edit() {
	id, _ := mi.GetInt("id", -1)
	if id <= 0 {
		response.ErrorWithMessage("Param is error.", mi.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService

	mysqlInstance := mysqlInstanceService.GetMysqlInstanceById(id)
	if mysqlInstance == nil {
		response.ErrorWithMessage("Not Found Info By Id.", mi.Ctx)
	}

	//获取用户等级
	mi.Data["data"] = mysqlInstance

	mi.Layout = "public/base.html"
	mi.TplName = "mysql_instance/edit.html"
}

// Update 用户-修改
func (mi *MysqlInstanceController) Update() {
	var mysqlInstanceForm formvalidate.MysqlInstanceForm
	if err := mi.ParseForm(&mysqlInstanceForm); err != nil {
		response.ErrorWithMessage(err.Error(), mi.Ctx)
	}

	if mysqlInstanceForm.ID <= 0 {
		response.ErrorWithMessage("Params is Error.", mi.Ctx)
	}

	v := validate.Struct(mysqlInstanceForm)

	if !v.Validate() {
		response.ErrorWithMessage(v.Errors.One(), mi.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService
	num := mysqlInstanceService.Update(&mysqlInstanceForm)

	if num > 0 {
		response.Success(mi.Ctx)
	} else {
		response.Error(mi.Ctx)
	}
}

// Enable 启用
func (mi *MysqlInstanceController) Enable() {
	idStr := mi.GetString("id")
	ids := make([]int, 0)
	var idArr []int

	if idStr == "" {
		mi.Ctx.Input.Bind(&ids, "id")
	} else {
		id, _ := strconv.Atoi(idStr)
		idArr = append(idArr, id)
	}

	if len(ids) > 0 {
		idArr = ids
	}

	var mysqlInstanceService services.MySQLInstanceService
	num := mysqlInstanceService.Enable(idArr)
	if num > 0 {
		response.SuccessWithMessageAndUrl("操作成功", global.URL_RELOAD, mi.Ctx)
	} else {
		response.Error(mi.Ctx)
	}
}

// Disable 禁用
func (mi *MysqlInstanceController) Disable() {
	idStr := mi.GetString("id")
	ids := make([]int, 0)
	var idArr []int

	if idStr == "" {
		mi.Ctx.Input.Bind(&ids, "id")
	} else {
		id, _ := strconv.Atoi(idStr)
		idArr = append(idArr, id)
	}

	if len(ids) > 0 {
		idArr = ids
	}

	if len(idArr) == 0 {
		response.ErrorWithMessage("请选择禁用的用户.", mi.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService
	num := mysqlInstanceService.Disable(idArr)
	if num > 0 {
		response.SuccessWithMessageAndUrl("操作成功", global.URL_RELOAD, mi.Ctx)
	} else {
		response.Error(mi.Ctx)
	}
}

// Del 删除
func (mi *MysqlInstanceController) Del() {
	idStr := mi.GetString("id")
	ids := make([]int, 0)
	var idArr []int

	if idStr == "" {
		mi.Ctx.Input.Bind(&ids, "id")
	} else {
		id, _ := strconv.Atoi(idStr)
		idArr = append(idArr, id)
	}

	if len(ids) > 0 {
		idArr = ids
	}

	if len(idArr) == 0 {
		response.ErrorWithMessage("参数id错误.", mi.Ctx)
	}

	noDeletionID := new(models.MysqlInstance).NoDeletionId()

	m, b := arrayOperations.Intersect(noDeletionID, idArr)

	if len(noDeletionID) > 0 && len(m.Interface().([]int)) > 0 && b {
		response.ErrorWithMessage("ID为"+strings.Join(utils.IntArrToStringArr(noDeletionID), ",")+"的数据无法删除!", mi.Ctx)
	}

	var mysqlInstanceService services.MySQLInstanceService
	count := mysqlInstanceService.Del(idArr)

	if count > 0 {
		response.SuccessWithMessageAndUrl("操作成功", global.URL_RELOAD, mi.Ctx)
	} else {
		response.Error(mi.Ctx)
	}
}
