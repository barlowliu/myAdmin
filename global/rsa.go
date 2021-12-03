package global

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/pem"
	"github.com/beego/beego/v2/core/logs"
)

var (
	rsaPub = `
-----BEGIN PUBLIC KEY-----
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALkTAuxWGZJ+gpl9UdTmgJMoBnuyP6Nx
Dl1XcLka18iOwd4A1IJ9NFJTnprHZbs2H+C8kVCRRsfPn74/FZRQqM0CAwEAAQ==
-----END PUBLIC KEY-----`
	rsaPri = `
-----BEGIN RSA PRIVATE KEY-----
MIIBOgIBAAJBALkTAuxWGZJ+gpl9UdTmgJMoBnuyP6NxDl1XcLka18iOwd4A1IJ9
NFJTnprHZbs2H+C8kVCRRsfPn74/FZRQqM0CAwEAAQJAc5Cug5sj7rj2nheF8LZa
VQlqOvVMDaf7+0ctiTh8w6tnArMJI7ZuR8lTYcAnqkrtT09yGmqajIliw3gDna2l
1QIhAPXWnyYJEW4Ef1/Le6CGMcrXPesEuMvP9ertCmWPrb6rAiEAwLlnk0uJ2hIN
c8UFVdqM3T8Daryxcf8msvEBMmAS1mcCIQDRDBU/MbzZkgeCPTU+Vn6m3wtu+w/t
eETE5ZbOsDPtiwIgTSMoUK1AXLczCS5Hh2h1TyykenlR8JW2cJLD7tzDTWsCIE2E
hiYuiaDgWobN/fIqpkcMFj48gi1daFhDUCTAHlmE
-----END RSA PRIVATE KEY-----`
)

//
//func init() {
//	rsaPub = BA_CONFIG.RSA.Public
//	rsaPri = BA_CONFIG.RSA.Private
//}

// RSAEncrypt @author: [Bralow Liu](http://www.toxingwang.com)
//@function: RSAEncrypt
//@description: RSA加密
//@param: plainText []byte, rsaPub []byte
//@return: cipherText []byte, err error
func RSAEncrypt(plainText string) (base64Test string, err error) {
	//解密pem格式的公钥
	//if len(rsaPub) == 0 {
	//	rsaPub = beego.AppConfig.String("rsaPub")
	//}
	var cipherText []byte
	var pubInterface interface{}
	block, _ := pem.Decode([]byte(rsaPub))
	logs.Debug("rsaPub:", string(rsaPub))
	if block != nil {
		logs.Debug("111")
		// 解析公钥
		if pubInterface, err = x509.ParsePKIXPublicKey(block.Bytes); err == nil {
			//加密
			if cipherText, err = rsa.EncryptPKCS1v15(
				rand.Reader, pubInterface.(*rsa.PublicKey), []byte(plainText)); err == nil {
				base64Test = base64.StdEncoding.EncodeToString(cipherText)
			}
		} else {
			logs.Debug("err:", err)
		}
	}
	logs.Debug("222")
	return
}

// RSADecrypt @author: [Bralow Liu](http://www.toxingwang.com)
//@function: RSADecrypt
//@description: RSA解密
//@param: plainText []byte, rsaPri []byte
//@return: cipherText []byte, err error
func RSADecrypt(cipherText []byte) (string, error) {
	var err error
	var byteDecode []byte
	var base64Byte []byte
	var private *rsa.PrivateKey
	block, _ := pem.Decode([]byte(rsaPri))
	if block != nil {
		if base64Byte, err = base64.StdEncoding.DecodeString(string(cipherText)); err == nil {
			//解析PKCS1格式的私钥
			if private, err = x509.ParsePKCS1PrivateKey(block.Bytes); err == nil {
				// 解密
				byteDecode, err = rsa.DecryptPKCS1v15(rand.Reader, private, base64Byte)
			}
		}
	}
	return string(byteDecode), err
}
