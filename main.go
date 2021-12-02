package main

import (
	"github.com/beego/beego/v2/core/logs"
	"github.com/beego/beego/v2/server/web"
	_ "myAdmin/initialize/conf"
	_ "myAdmin/initialize/mysql"
	_ "myAdmin/initialize/session"
	_ "myAdmin/routers"
	_ "myAdmin/utils/template"
)

func main() {

	//输出文件名和行号
	logs.SetLogFuncCall(true)

	//init
	//global.MySQLInit()
	//models.Migrate()

	//启动beego
	web.Run()
}
