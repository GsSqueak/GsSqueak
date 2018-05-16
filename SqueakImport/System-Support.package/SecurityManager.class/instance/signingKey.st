accessing
signingKey
	"Return the key used for signing projects"
	^privateKeyPair ifNotNil:[privateKeyPair first]