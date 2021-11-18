package global

import (
	"fmt"
	"github.com/beego/beego/v2/core/logs"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"os"
	"time"
)

var (
	DataSource string
	Db         *gorm.DB
)

func DbInit() {
	DataSource = fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s",
		BA_CONFIG.Mysql.Username,
		BA_CONFIG.Mysql.Password,
		BA_CONFIG.Mysql.Host,
		BA_CONFIG.Mysql.Port,
		BA_CONFIG.Mysql.Database,
		BA_CONFIG.Mysql.Charset,
	)
	newDb, err := gorm.Open(mysql.New(mysql.Config{
		DSN:                       DataSource, // DSN data source name
		DefaultStringSize:         256,        // string 类型字段的默认长度
		DisableDatetimePrecision:  true,       // 禁用 datetime 精度，MySQL 5.6 之前的数据库不支持
		DontSupportRenameIndex:    true,       // 重命名索引时采用删除并新建的方式，MySQL 5.7 之前的数据库和 MariaDB 不支持重命名索引
		DontSupportRenameColumn:   true,       // 用 `change` 重命名列，MySQL 8 之前的数据库和 MariaDB 不支持重命名列
		SkipInitializeWithVersion: false,      // 根据当前 MySQL 版本自动配置
	}), &gorm.Config{})
	if err != nil {
		logs.Error("mysql连接失败! 亲 数据库建了没？ 配置填对了没？")
		os.Exit(1)
	}
	Db = newDb
	sqlDb, _ := Db.DB()
	sqlDb.SetConnMaxLifetime(time.Minute * 10)
	sqlDb.SetMaxOpenConns(100)
	sqlDb.SetMaxIdleConns(15)
}
