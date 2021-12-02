package conf

// RSA证书相关配置
type RSA struct {
	Public  string `mapstructure:"public" json:"public" yaml:"public"`
	Private string `mapstructure:"private" json:"private" yaml:"private"`
}
