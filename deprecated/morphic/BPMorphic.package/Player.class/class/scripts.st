scripts
scripts
	"Answer the receiver's scripts -- an IdentityDictionary"
	scripts
		ifNil: [scripts := IdentityDictionary new]
		ifNotNil: [self cleanseScriptsOfNilKeys].
	^ scripts