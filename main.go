package main

import (
	"github.com/beego/beego/v2/core/logs"
	"github.com/beego/beego/v2/server/web"
	"myAdmin/global"
	_ "myAdmin/initialize/conf"
	_ "myAdmin/initialize/mysql"
	_ "myAdmin/initialize/session"
	"myAdmin/models"
	_ "myAdmin/routers"
	"myAdmin/services"
	_ "myAdmin/utils/template"
)

func main() {

	//输出文件名和行号
	logs.SetLogFuncCall(true)

	//init
	global.MySQLInit()
	models.Migrate()

	//test
	i := models.MysqlInstance{Addr: "nmsdb8-0.nmsdb8.test.svc.test.yafex.net", Port: 3306}
	err := i.GetOne()
	if err == nil {
		userList, err := services.GetInstanceAllDb(i)
		if err != nil {
			logs.Warn(err)
			return
		}
		num := services.MysqlDbInBatches(userList)
		//for _,v := range userList {
		//	logs.Info("addr:%s, %s@%s:%s\n",v.Instance.Addr, v.User, v.Host, v.SelectPriv)
		//}
		logs.Info("rows:%d", num)

	}

	//启动beego
	web.Run()
}
