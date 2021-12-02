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
	rsaPub string
	rsaPri string
)

func init() {
	rsaPub = BA_CONFIG.RSA.Public
	rsaPri = BA_CONFIG.RSA.Private
}

// RSAEncrypt @author: [Bralow Liu](http://www.toxingwang.com)
//@function: RSAEncrypt
//@description: RSA加密
//@param: plainText []byte, rsaPub []byte
//@return: cipherText []byte, err error
func RSAEncrypt(plainText string) (base64Test []byte, err error) {
	//解密pem格式的公钥
	if len(rsaPub) == 0 {
		rsaPub = BA_CONFIG.RSA.Public
	}
	var cipherText []byte
	var pubInterface interface{}
	block, _ := pem.Decode([]byte(rsaPub))
	logs.Debug("rsaPub:", string(rsaPub))
	if block != nil {
		logs.Debug("111")
		// 解析公钥
		if pubInterface, err = x509.ParsePKIXPublicKey(block.Bytes); err == nil {
			logs.Debug("pubInterface:", pubInterface)
			//加密
			if cipherText, err = rsa.EncryptPKCS1v15(
				rand.Reader, pubInterface.(*rsa.PublicKey), []byte(plainText)); err == nil {
				base64Test = []byte(base64.StdEncoding.EncodeToString(cipherText))
			}
		} else {
			logs.Debug("err:", err)
		}
	}
	logs.Debug("222")
	return base64Test, err
}

// RSADecrypt @author: [Bralow Liu](http://www.toxingwang.com)
//@function: RSADecrypt
//@description: RSA解密
//@param: plainText []byte, rsaPri []byte
//@return: cipherText []byte, err error
func RSADecrypt(cipherText []byte) (string, error) {
	//获取私钥
	if len(rsaPri) == 0 {
		rsaPri = BA_CONFIG.RSA.Private
	}

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
