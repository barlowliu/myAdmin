package models

import (
	"github.com/beego/beego/v2/core/logs"
	"myAdmin/global"
)

//MysqlGlobalVariable mysql全局变量表
type MysqlGlobalVariable struct {
	ID           int    `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	InstanceID   int    `json:"instance_id" gorm:"uniqueIndex:idx_insID_variable,comment:关联实例ID"`
	VariableName string `json:"variable_name" gorm:"uniqueIndex:idx_insID_variable,comment:变量名"`
	Value        string `gorm:"comment:变量值"`
	CreateTime   int    `orm:"column(create_time);size(10);default(0)" description:"操作时间" json:"create_time"`
	UpdateTime   int    `orm:"column(update_time);size(10);default(0)" description:"更新时间" json:"update_time"`
	DeleteTime   int    `orm:"column(delete_time);;size(10);default(0)" description:"删除时间" json:"delete_time"`
}

//GetGlobalVariable 获取全局变量数据
//func (i *MysqlInstance) GetGlobalVariable() {
//	var err error
//	//如果实例信息不全，则查询失败
//	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
//		logs.Warn("Instance information is not incomplete.")
//		return
//	}
//	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/?charset=utf8",
//		i.AdminUser,
//		i.AdminPassword,
//		i.Addr,
//		i.Port,
//	)
//	db, err := global.NewDB(dsn)
//	if err != nil {
//		logs.Warn("Create DNS error:", err)
//		return
//	}
//	sql := "SHOW GLOBAL VARIABLES"
//	rows, err := db.Raw(sql).Rows()
//	logs.Debug(rows.Columns())
//	if err != nil {
//		logs.Warn("Query mysql GLOBAL VARIABLES error:", err)
//		return
//	}
//	defer rows.Close()
//	var gvariable MysqlGlobalVariable
//	for rows.Next() {
//		var name, value string
//		err = rows.Scan(&name, &value)
//		if err != nil {
//			continue
//		}
//		gvariable.VariableName = name
//		gvariable.Value = value
//		gvariable.InstanceID = i.ID
//		//更新到本地数据库存储
//		gvariable.Update()
//		i.Gvariable = append(i.Gvariable, gvariable)
//	}
//	return
//}

//Update 更新数据
func (v MysqlGlobalVariable) Update() (err error) {
	var variable MysqlGlobalVariable
	//不存在就创建
	if err := global.Db.Where("instance_id = ? AND variable_name = ?", v.InstanceID, v.VariableName).First(&variable).Error; err != nil {
		if err := global.Db.Create(&v).Error; err != nil {
			logs.Warn("Insert data to db error：", err)
		}
	} else {
		//	存在则更新
		v.Value = variable.Value
		if err := global.Db.Save(&v).Error; err != nil {
			logs.Warn("Update data to db error：", err)
		}
	}
	return
}
