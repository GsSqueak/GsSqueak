accessing
trustedKeys
	"Return an array of trusted public keys for verifying some project"
	privateKeyPair ifNil:[^trustedKeys].
	^{privateKeyPair second}, trustedKeys