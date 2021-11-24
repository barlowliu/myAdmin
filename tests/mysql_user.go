package main

import (
	"github.com/beego/beego/v2/core/logs"
	"github.com/beego/beego/v2/server/web"
	"myAdmin/global"
	"myAdmin/models"
	"myAdmin/services"
)

func main() {
	//init
	global.MySQLInit()
	models.Migrate()

	i := models.MysqlInstance{Addr: "127.0.0.1"}
	err := i.GetOne()
	if err == nil {
		userList, err := services.GetInstanceAllUser(i)
		if err != nil {
			logs.Warn(err)
			return
		}
		logs.Info("%+v", userList)
	}
	web.Run()
}
