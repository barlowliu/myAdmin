package models

//Processlist mysql进程列表实时数据
type Processlist struct {
	ID           int64 `gorm:"type:bigint;NOT NULL;DEFAULT '0'"`
	User         string
	Host         string
	DB           string
	Command      string
	Info         string
	Time         int64
	State        string
	TimeMs       int64
	RowsSent     int64
	RowsExamined int64
}

//func (i *MysqlInstance) GetProcessList() {
//	var err error
//	//如果实例信息不全，则查询失败
//	if len(i.Addr) == 0 || i.Port <= 100 || len(i.AdminUser) == 0 || len(i.AdminPassword) == 0 {
//		logs.Warn("Instance information is not incomplete.")
//		return
//	}
//	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/?charset=utf8",
//		i.AdminUser,
//		i.AdminPassword,
//		i.Addr,
//		i.Port,
//	)
//	db, err := global.NewDB(dsn)
//	if err != nil {
//		logs.Warn("Create DSN error:", err)
//		return
//	}
//	sql := `
//           SELECT
//           	ID AS id,
//           	USER AS user,
//           	HOST AS host,
//           	DB AS db,
//           	COMMAND AS command,
//            INFO AS info,
//           	TIME AS time,
//           	STATE AS state,
//           	TIME_MS AS time_ms,
//           	ROWS_SENT AS rows_sent,
//           	ROWS_EXAMINED AS rows_examined
//           FROM
//           	information_schema.PROCESSLIST`
//	rows, err := db.Raw(sql).Rows()
//	//logs.Debug(rows.Columns())
//	if err != nil {
//		logs.Warn("Query mysql processlist error:", err)
//		return
//	}
//	defer rows.Close()
//	var process Processlist
//	for rows.Next() {
//		err = db.ScanRows(rows, &process)
//		if err != nil {
//			continue
//		}
//		i.Processlist = append(i.Processlist, process)
//	}
//	return
//}
