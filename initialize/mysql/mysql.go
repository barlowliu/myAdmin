package mysql

import (
	"fmt"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/logs"
	"myAdmin/global"
	// mysql driver
	_ "github.com/go-sql-driver/mysql"
)

// init 注册mysql
func init() {
	err := orm.RegisterDriver("mysql", orm.DRMySQL)
	if err != nil {
		logs.Error("mysql register driver error:", err)
	}

	//dataSource := "root:root@tcp(127.0.0.1:3306)/test"
	dataSource := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8",
		global.BA_CONFIG.Mysql.Username,
		global.BA_CONFIG.Mysql.Password,
		global.BA_CONFIG.Mysql.Host,
		global.BA_CONFIG.Mysql.Port,
		global.BA_CONFIG.Mysql.Database,
	)

	maxIdle := 20
	maxConn := 100

	err = orm.RegisterDataBase("default", "mysql", dataSource, orm.MaxIdleConnections(maxIdle), orm.MaxOpenConnections(maxConn))
	if err != nil {
		logs.Error("mysql register database error:", err)
	}
}
