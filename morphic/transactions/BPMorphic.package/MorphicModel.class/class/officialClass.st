testing
officialClass
	"We want to make a new instance of the receiver, which is a subclass
	of MorphicModel. Answer who to make a new subclass of. Also used to
	tell if a given class is a UniClass, existing only for its single instance."
	^ self name last isDigit
		ifTrue: [MorphicModel]
		ifFalse: [self
			"MorphicModel7 can not have subclasses, but Slider and
			SystemWindow may"]