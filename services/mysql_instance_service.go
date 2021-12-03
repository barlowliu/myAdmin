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
func (*MySQLInstanceService) Create(form *formvalidate.MysqlInstanceForm) (id int64, err error) {
	instance := models.MysqlInstance{
		Name:      form.Name,
		Addr:      form.Addr,
		Port:      form.Port,
		AdminUser: form.AdminUser,
		//AdminPassword: form.AdminPassword,
		MonitorUser: form.MonitorUser,
		//MonitorPassword: form.MonitorPassword,
		Description: form.Description,
		State:       int(form.State),
		CreateTime:  int(time.Now().Unix()),
		UpdateTime:  int(time.Now().Unix()),
	}

	//密码字段加密
	var (
		adminPassword   string
		monitorPassword string
	)
	adminPassword, err = global.RSAEncrypt(form.AdminPassword)
	if err != nil {
		logs.Debug("err:", err)
		return
	}
	instance.AdminPassword = adminPassword
	logs.Debug("AdminPassword:", instance.AdminPassword)

	if len(form.MonitorPassword) > 0 {
		monitorPassword, err = global.RSAEncrypt(form.MonitorPassword)
		if err != nil {
			logs.Debug("err:", err)
			return
		}
		instance.MonitorPassword = monitorPassword
		logs.Debug("MonitorPassword:", instance.MonitorPassword)
	}

	id, err = orm.NewOrm().Insert(&instance)

	if err == nil {
		return
	}
	logs.Error("err:", err)
	return
}

// GetUserById 根据id获取一条user数据
func (*MySQLInstanceService) GetMysqlInstanceById(id int) *models.MysqlInstance {
	o := orm.NewOrm()
	instance := models.MysqlInstance{ID: id}
	err := o.Read(&instance)
	if err != nil {
		return nil
	}
	return &instance
}

// Update 更新用户
func (*MySQLInstanceService) Update(form *formvalidate.MysqlInstanceForm) int {
	o := orm.NewOrm()
	instance := models.MysqlInstance{ID: form.ID}
	if o.Read(&instance) == nil {
		//判断密码是否相等
		if instance.AdminPassword != form.AdminPassword {
			newAdminPassword, err := global.RSAEncrypt(form.AdminPassword)
			if err == nil {
				instance.AdminPassword = newAdminPassword
			}
		}
		if instance.MonitorPassword != form.MonitorPassword {
			newMonitorPasswd, err := global.RSAEncrypt(form.MonitorPassword)
			if err == nil {
				instance.MonitorPassword = newMonitorPasswd
			}
		}

		instance.Name = form.Name
		instance.AdminUser = form.AdminUser
		instance.MonitorUser = form.MonitorUser
		instance.Addr = form.Addr
		instance.Port = form.Port
		instance.Description = form.Description
		instance.State = int(form.State)
		instance.UpdateTime = int(time.Now().Unix())

		num, err := o.Update(&instance)

		if err == nil {
			return int(num)
		}
		logs.Error("更新实例失败：", err)
		return 0
	}
	return 0
}

// Enable 启用
func (*MySQLInstanceService) Enable(ids []int) int {
	num, err := orm.NewOrm().QueryTable(new(models.MysqlInstance)).Filter("id__in", ids).Update(orm.Params{
		"state": 1,
	})
	if err == nil {
		return int(num)
	}
	return 0
}

// Disable 禁用
func (*MySQLInstanceService) Disable(ids []int) int {
	num, err := orm.NewOrm().QueryTable(new(models.MysqlInstance)).Filter("id__in", ids).Update(orm.Params{
		"state": 0,
	})
	if err == nil {
		return int(num)
	}
	return 0
}

// Del 删除
func (*MySQLInstanceService) Del(ids []int) int {
	count, err := orm.NewOrm().QueryTable(new(models.MysqlInstance)).Filter("id__in", ids).Delete()
	if err == nil {
		return int(count)
	}
	return 0
}
