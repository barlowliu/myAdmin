package services

import (
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/logs"
	"myAdmin/formvalidate"
	"myAdmin/global"
	"myAdmin/models"
	"myAdmin/utils/page"
	"net/url"
	"time"
)

// MySQLInstanceService struct
type MySQLInstanceService struct {
	BaseService
}

// GetPaginateData 通过分页获取MySQL实例
func (mi *MySQLInstanceService) GetPaginateData(listRows int, params url.Values) ([]*models.MysqlInstance, page.Pagination) {
	//搜索、查询字段赋值
	mi.SearchField = append(mi.SearchField, new(models.MysqlInstance).SearchField()...)

	var instances []*models.MysqlInstance
	o := orm.NewOrm().QueryTable(new(models.MysqlInstance))
	_, err := mi.PaginateAndScopeWhere(o, listRows, params).All(&instances)
	if err != nil {
		logs.Warn("err:", err)
		return nil, mi.Pagination
	}
	return instances, mi.Pagination
}

// Create 新增数据库实例
func (*MySQLInstanceService) Create(form *formvalidate.MysqlInstanceForm) int {
	instance := models.MysqlInstance{
		Name:        form.Name,
		Addr:        form.Addr,
		Port:        form.Port,
		AdminUser:   form.AdminUser,
		Description: form.Description,
		State:       int(form.State),
		CreateTime:  int(time.Now().Unix()),
		UpdateTime:  int(time.Now().Unix()),
	}

	//密码字段加密
	var (
		adminPassword   []byte
		monitorPassword []byte
		err             error
	)
	adminPassword, err = global.RSAEncrypt(form.AdminPassword)
	if err != nil {
		return 0
	}
	instance.AdminPassword = string(adminPassword)
	if len(form.MonitorPasswd) > 0 {
		monitorPassword, err = global.RSAEncrypt(form.MonitorPasswd)
		if err != nil {
			return 0
		}
		instance.MonitorPasswd = string(monitorPassword)
	}

	//user.Password = base64.StdEncoding.EncodeToString([]byte(newPasswordForHash))

	id, err := orm.NewOrm().Insert(&instance)

	if err == nil {
		return int(id)
	}
	return 0
}
