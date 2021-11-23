package models

import "time"

//WorkflowDefination 工作流定义表
type WorkflowDefination struct {
	GModel
	Name    string
	Handler string
}

//WorkflowNode 流程结点步骤表
type WorkflowNode struct {
	GModel
	DefinationID   int
	Defination     WorkflowDefination `gorm:"foreignKey:DefinationID"`
	NodeIndex      int
	NodeName       string
	NodeType       int       //节点类型
	NextNodeIndex  int       //后节点序号
	ExecuteType    int       //执行类型，0审批，1执行
	ExecutorRoleID int       //执行角色ID
	Role           AdminRole `gorm:"foreignKey:ExecutorRoleID"`
	Remind         int       //提醒类型， 0 不提醒  1 邮件  2 短信  3 邮件和短信
	MaxDay         int       //最长时间
}

//WorkflowProcess 流程执行进程表
type WorkflowProcess struct {
	GModel
	DefinationID     int
	Defination       WorkflowDefination `gorm:"foreignKey:DefinationID"`
	ProcessDesc      string             //进程描述
	Context          string             //上下文变量
	CurrentNodeIndex int                //当前节点序号
	StartTime        time.Time
	FinishTime       time.Time
	State            int    //状态， 1运行，2结束
	StartUser        string //发起人
}

//WorkflowThread 流程执行线程表
type WorkflowThread struct {
	GModel
	ProcessID   int
	Process     WorkflowProcess `gorm:"foreignKey:ProcessID"`
	NodeID      int
	Node        WorkflowNode `gorm:"foreignKey:NodeID"`
	ExecutorID  int
	Executor    AdminUser `gorm:"foreignKey:ExecutorID"`
	StartTime   time.Time
	ReceiveTime time.Time
	FinishTime  time.Time
	State       int //状态，0 未接收  1 已接收  2已处理
}
