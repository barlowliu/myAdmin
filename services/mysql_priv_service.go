package services

import (
	"fmt"
	"github.com/beego/beego/v2/core/logs"
	"github.com/bitly/go-simplejson"
	"myAdmin/global"
	"myAdmin/models"
)

//GetInstanceAllUser 获取MySQL实例对应的mysql.user表
func GetInstanceAllUser(i models.MysqlInstance) (userList []models.MysqlUser, err error) {
	//如果实例信息不全，则查询失败
	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
		return nil, fmt.Errorf("instance information is not incomplete")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/mysql?charset=utf8",
		i.AdminUser,
		i.AdminPassword,
		i.Addr,
		i.Port,
	)
	db, err := global.NewDB(dsn)

	if err != nil {
		logs.Warn("Cannot connect to dsn:", err)
		return
	}
	rows, err := db.Raw("SELECT * FROM `user`").Rows()
	defer rows.Close()
	if err != nil {
		logs.Warn("Select error:", err)
		return
	}
	//将查询到的数据转换为json数据
	var user models.MysqlUser
	for rows.Next() {
		userJSON, err := models.Rows2JSON(rows)
		if err != nil {
			continue
		}
		user.InstanceID = i.ID
		user.Data = string(userJSON)
		//从json中解析除user和host，实现唯一性
		j, _ := simplejson.NewJson(userJSON)
		u, _ := j.Get("User").String()
		h, _ := j.Get("Host").String()
		//组合为root@%这样的用户格式
		user.User = fmt.Sprintf("%s@%s", u, h)
		userList = append(userList, user)
	}
	return
}

//MysqlUserInBatches 按行逐条插入数据到mysql_user表
func MysqlUserInBatches(userList []models.MysqlUser) (count int64) {
	for _, u := range userList {
		var userRow models.MysqlUser
		//不存在就创建
		if err := global.Db.Where("instance_id = ? AND user = ?", u.InstanceID, u.User).First(&userRow).Error; err != nil {
			if err := global.Db.Create(&u).Error; err != nil {
				logs.Warn("Insert data to db error：", err)
				continue
			}
		} else {
			//	存在则更新
			userRow.Data = u.Data
			if err := global.Db.Save(&userRow).Error; err != nil {
				logs.Warn("Update data to db error：", err)
				continue
			}
		}
		count++
	}
	return
}

//GetInstanceAllDb 获取MySQL实例对应的mysql.db表
func GetInstanceAllDb(i models.MysqlInstance) (dbList []models.MysqlDB, err error) {
	//如果实例信息不全，则查询失败
	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
		return nil, fmt.Errorf("instance information is not incomplete")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/mysql?charset=utf8",
		i.AdminUser,
		i.AdminPassword,
		i.Addr,
		i.Port,
	)
	db, err := global.NewDB(dsn)

	if err != nil {
		logs.Warn("Cannot connect to dsn:", err)
		return
	}
	rows, err := db.Raw("SELECT * FROM `db`").Rows()
	defer rows.Close()
	if err != nil {
		logs.Warn("Select err:", err)
		return
	}
	//将查询到的数据转换为json数据
	var dbRow models.MysqlDB
	for rows.Next() {
		// 序列化数据
		dbJSON, err := models.Rows2JSON(rows)
		if err != nil {
			logs.Error(err.Error())
			continue
		}
		dbRow.InstanceID = i.ID
		dbRow.Data = string(dbJSON)
		//从json中解析除user和host，实现唯一性
		j, _ := simplejson.NewJson(dbJSON)
		dbRow.Db, _ = j.Get("Db").String()
		u, _ := j.Get("User").String()
		h, _ := j.Get("Host").String()
		//组合为root@%这样的用户格式
		dbRow.User = fmt.Sprintf("%s@%s", u, h)
		dbList = append(dbList, dbRow)
	}
	return
}

//MysqlDbInBatches 按行逐条插入数据到mysql_db表
func MysqlDbInBatches(userList []models.MysqlDB) (count int64) {
	for _, u := range userList {
		var dbRow models.MysqlDB
		//不存在就创建
		if err := global.Db.Where("instance_id = ? AND db = ? AND user = ?", u.InstanceID, u.Db, u.User).First(&dbRow).Error; err != nil {
			if err := global.Db.Create(&u).Error; err != nil {
				logs.Warn("Insert data to db error：", err)
				continue
			}
		} else {
			//	存在则更新
			dbRow.Data = u.Data
			if err := global.Db.Save(&dbRow).Error; err != nil {
				logs.Warn("Update data to db error：", err)
				continue
			}
		}
		count++
	}
	return
}
