package conf

type Server struct {
	Base       Base       `mapstructure:"base" json:"base" yaml:"base"`
	Mysql      Mysql      `mapstructure:"mysql" json:"mysql" yaml:"mysql"`
	Redis      Redis      `mapstructure:"redis" json:"redis" yaml:"redis"`
	RSA        RSA        `mapstructure:"rsa" json:"rsa" yaml:"rsa"`
	Attachment Attachment `mapstructure:"attachment" json:"attachment" yaml:"attachment"`
	Login      Login      `mapstructure:"login" json:"login" yaml:"login"`
	Other      Other      `mapstructure:"other" json:"other" yaml:"other"`
	Ueditor    Ueditor    `mapstructure:"ueditor" json:"ueditor" yaml:"ueditor"`
}
