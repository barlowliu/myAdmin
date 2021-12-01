package models

import (
	"database/sql"
	"encoding/json"
	"github.com/beego/beego/v2/core/logs"
)

func Rows2JSON(rows *sql.Rows) (j []byte, err error) {
	columns, err := rows.Columns()
	if err != nil {
		logs.Error("Scan columns error: %s", err.Error())
		return
	}

	count := len(columns)
	values := make([]interface{}, count)
	scanArgs := make([]interface{}, count)

	for i := range values {
		scanArgs[i] = &values[i]
	}
	err = rows.Scan(scanArgs...)
	if err != nil {
		logs.Error("Scan data error: %s", err.Error())
		return
	}

	entry := make(map[string]interface{})
	for i, col := range columns {
		v := values[i]
		colName, ok := v.([]byte)
		if ok {
			entry[col] = string(colName)
		} else {
			entry[col] = v
		}
	}
	// 序列化数据
	j, err = json.Marshal(entry)
	if err != nil {
		logs.Error("JSON Marshal error: %s", err.Error())
	}
	return
}
