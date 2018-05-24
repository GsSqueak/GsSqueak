file in/out
downloadUrl
	"^(self primaryServerIfNil: [^'']) downloadUrl"
	^lastDirectory
		ifNil: [(self primaryServerIfNil: [^'']) downloadUrl]
		ifNotNil: [lastDirectory downloadUrl]