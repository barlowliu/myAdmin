package main

import (
	"fmt"
	"github.com/beego/beego/v2/core/logs"
	"github.com/beego/beego/v2/server/web"
	"myAdmin/global"
	_ "myAdmin/initialize/conf"
	_ "myAdmin/initialize/mysql"
	_ "myAdmin/initialize/session"
	"myAdmin/models"
	_ "myAdmin/routers"
	_ "myAdmin/utils/template"
)

func main() {

	//输出文件名和行号
	logs.SetLogFuncCall(true)

	//init
	global.MySQLInit()
	models.Migrate()

	//test
	//i := models.MysqlInstance{Addr: "127.0.0.1", Port: 3306}
	i := models.MysqlInstance{Addr: "nmsdb8-0.nmsdb8.test.svc.test.yafex.net", Port: 3306}
	err := i.GetOne()
	if err == nil {
		//userList, err := services.GetInstanceAllDb(i)
		//if err != nil {
		//	logs.Warn(err)
		//	return
		//}
		//num := services.MysqlDbInBatches(userList)
		//logs.Info("rows:%d", num)
		//i.GetGlobalVariable()
		//for _,v :=  range i.Gvariable {
		//	fmt.Printf("%s:%s\n", v.VariableName, v.Value)
		//}
		i.GetProcessList()
		for _, v := range i.Processlist {
			fmt.Printf("%+v\n", v)
		}

	}

	//启动beego
	web.Run()
}
