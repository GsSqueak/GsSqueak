-Etoys-support
creationStamp
	"Answer the creation stamp stored within the receiver, if any"
	^ self
		valueOfProperty: #creationStamp
		ifAbsent: [super creationStamp]