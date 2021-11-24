package services

import (
	"encoding/json"
	"fmt"
	"github.com/beego/beego/v2/core/logs"
	"myAdmin/global"
	"myAdmin/models"
)

//GetInstanceAllUser 获取MySQL实例对应的mysql.user表
func GetInstanceAllUser(i models.MysqlInstance) (userList []models.MysqlUser, err error) {
	//如果实例信息不全，则查询失败
	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
		return nil, fmt.Errorf("传入的实例信息不全")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/mysql?charset=utf8",
		i.AdminUser,
		i.AdminPassword,
		i.Addr,
		i.Port,
	)
	db, err := global.NewDB(dsn)

	if err != nil {
		logs.Warn("连接到目标数据库失败：", err)
		return
	}
	rows, err := db.Raw("SELECT * FROM `user`").Rows()
	defer rows.Close()
	if err != nil {
		logs.Warn("查询数据失败：", err)
		return
	}
	//将查询到的数据转换为json数据
	var user models.MysqlUser
	columns, err := rows.Columns()
	if err != nil {
		panic(err.Error())
	}

	count := len(columns)
	values := make([]interface{}, count)
	scanArgs := make([]interface{}, count)

	for i := range values {
		scanArgs[i] = &values[i]
	}

	for rows.Next() {
		err := rows.Scan(scanArgs...)
		if err != nil {
			logs.Error("Sacn data error: %s", err.Error())
			continue
		}

		entry := make(map[string]interface{})
		for i, col := range columns {
			v := values[i]

			b, ok := v.([]byte)
			if ok {
				entry[col] = string(b)
			} else {
				entry[col] = v
			}
		}
		// 序列化数据
		b, err := json.Marshal(entry)
		if err != nil {
			logs.Error(err.Error())
			continue
		}
		user.InstanceID = i.ID
		user.Data = string(b)
		userList = append(userList, user)
	}
	return
}

//MysqlUserInBatches 按行逐条插入数据到mysql_user表
func MysqlUserInBatches(userList []models.MysqlUser) (count int64) {
	for _, u := range userList {
		result := global.Db.Create(&u)
		if result.Error != nil {
			logs.Warn("批量插入数据失败：", result.Error)
			continue
		}
		count++
	}
	return
}

//GetInstanceAllDb 获取MySQL实例对应的mysql.db表
func GetInstanceAllDb(i models.MysqlInstance) (userList []models.MysqlDB, err error) {
	//如果实例信息不全，则查询失败
	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
		return nil, fmt.Errorf("传入的实例信息不全")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/mysql?charset=utf8",
		i.AdminUser,
		i.AdminPassword,
		i.Addr,
		i.Port,
	)
	db, err := global.NewDB(dsn)

	if err != nil {
		logs.Warn("连接到目标数据库失败：", err)
		return
	}
	rows, err := db.Raw("SELECT * FROM `db`").Rows()
	defer rows.Close()
	if err != nil {
		logs.Warn("查询数据失败：", err)
		return
	}
	//将查询到的数据转换为json数据
	var user models.MysqlDB
	columns, err := rows.Columns()
	if err != nil {
		panic(err.Error())
	}

	count := len(columns)
	values := make([]interface{}, count)
	scanArgs := make([]interface{}, count)

	for i := range values {
		scanArgs[i] = &values[i]
	}

	for rows.Next() {
		err := rows.Scan(scanArgs...)
		if err != nil {
			logs.Error("Sacn data error: %s", err.Error())
			continue
		}

		entry := make(map[string]interface{})
		for i, col := range columns {
			v := values[i]

			b, ok := v.([]byte)
			if ok {
				entry[col] = string(b)
			} else {
				entry[col] = v
			}
		}
		// 序列化数据
		b, err := json.Marshal(entry)
		if err != nil {
			logs.Error(err.Error())
			continue
		}
		user.InstanceID = i.ID
		user.Data = string(b)
		userList = append(userList, user)
	}
	return
}

//MysqlDbInBatches 按行逐条插入数据到mysql_db表
func MysqlDbInBatches(userList []models.MysqlDB) (count int64) {
	for _, u := range userList {
		result := global.Db.Create(&u)
		if result.Error != nil {
			logs.Warn("批量插入数据失败：", result.Error)
			continue
		}
		count++
	}
	return
}
