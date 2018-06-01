accessing - layout properties
layoutProperties: newProperties 
	"Return the current layout properties associated with the receiver"

	newProperties isNil
		ifTrue: [self removeProperty: #layoutProperties]
		ifFalse: [self setProperty: #layoutProperties toValue: newProperties]