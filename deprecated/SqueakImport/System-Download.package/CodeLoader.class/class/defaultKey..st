accessing
defaultKey: aPublicKey
	"Store the default key used for verifying signatures of loaded code"
	DefaultKey := aPublicKey
	"CodeLoader defaultKey: DOLPublicKey"
	"CodeLoader defaultKey: (DigitalSignatureAlgorithm testKeySet at: 2)"