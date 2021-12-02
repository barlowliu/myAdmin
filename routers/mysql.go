package routers

import (
	"github.com/beego/beego/v2/server/web"
	"myAdmin/controllers"
)

func InitMysqlInstanceRoute() {
	//MySQL模块路由
	mysqlInstance := web.NewNamespace("/mysql",
		//MySQL实例管理
		web.NSRouter("/instance/index", &controllers.MysqlInstance{}, "get:Index"),
		//MySQL实例管理-添加界面
		web.NSRouter("/instance/add", &controllers.MysqlInstance{}, "get:Add"),
		//MySQL实例管理-添加
		web.NSRouter("/instance/create", &controllers.MysqlInstance{}, "post:Create"),
		////MySQL实例管理-修改界面
		//web.NSRouter("/instance/edit", &controllers.MysqlInstance{}, "get:Edit"),
		////MySQL实例管理-修改
		//web.NSRouter("/instance/update", &controllers.MysqlInstance{}, "post:Update"),
		////MySQL实例管理-启用
		//web.NSRouter("/instance/enable", &controllers.MysqlInstance{}, "post:Enable"),
		////MySQL实例管理-禁用
		//web.NSRouter("/instance/disable", &controllers.MysqlInstance{}, "post:Disable"),
		////MySQL实例管理-删除
		//web.NSRouter("/instance/del", &controllers.MysqlInstance{}, "post:Del"),
		////MySQL实例管理-导出
		//web.NSRouter("/instance/export", &controllers.MysqlInstance{}, "get:Export"),
	)

	web.AddNamespace(mysqlInstance)
}
