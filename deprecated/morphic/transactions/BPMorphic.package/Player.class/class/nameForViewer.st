other
nameForViewer
	"Answer the name by which the receiver is to be referred in a viewer"
	^ self isUniClass
		ifTrue: [self someInstance getName]
		ifFalse: [super nameForViewer]