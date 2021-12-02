package routers

import (
	"github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/server/web/context"
	"myAdmin/middleware"
	"net/http"
)

func init() {
	//授权登录中间件
	middleware.AuthMiddle()

	web.Get("/", func(ctx *context.Context) {
		ctx.Redirect(http.StatusFound, "/admin/index/index")
	})
	InitAdminRoute()
	InitMysqlInstanceRoute()
}
