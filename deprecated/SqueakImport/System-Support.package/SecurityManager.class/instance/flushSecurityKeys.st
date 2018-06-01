initialize-release
flushSecurityKeys
	"Flush all keys"
	privateKeyPair ifNotNil:[
		self flushSecurityKey: privateKeyPair first.
		self flushSecurityKey: privateKeyPair last.
	].
	privateKeyPair := nil.
	trustedKeys do:[:key| self flushSecurityKey: key].
	trustedKeys := #().