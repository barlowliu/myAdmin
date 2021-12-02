package mysql

import "C"
import (
	"fmt"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/logs"
	"myAdmin/global"
	"myAdmin/models"

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
	DataSource := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s",
		global.BA_CONFIG.Mysql.Username,
		global.BA_CONFIG.Mysql.Password,
		global.BA_CONFIG.Mysql.Host,
		global.BA_CONFIG.Mysql.Port,
		global.BA_CONFIG.Mysql.Database,
		global.BA_CONFIG.Mysql.Charset,
	)

	maxIdle := 20
	maxConn := 100

	err = orm.RegisterDataBase("default", "mysql", DataSource, orm.MaxIdleConnections(maxIdle), orm.MaxOpenConnections(maxConn))
	if err != nil {
		logs.Error("mysql register database error:", err)
	}

	orm.RegisterModel(new(models.MysqlInstance))
	orm.RunSyncdb("default", false, true)
}
