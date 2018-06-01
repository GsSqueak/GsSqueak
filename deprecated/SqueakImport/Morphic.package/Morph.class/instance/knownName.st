testing
knownName
	"answer a name by which the receiver is known, or nil if none"
	^ extension ifNotNil: [extension externalName]