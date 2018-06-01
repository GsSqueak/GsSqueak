navigation
setWrapPages: doWrap
	doWrap
		ifTrue: [self removeProperty: #dontWrapAtEnd]
		ifFalse: [self setProperty: #dontWrapAtEnd toValue: true].
