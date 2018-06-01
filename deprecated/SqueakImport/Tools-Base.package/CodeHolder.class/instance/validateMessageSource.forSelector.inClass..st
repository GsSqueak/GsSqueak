message list
validateMessageSource: sourceString forSelector: aSelector inClass: theClass
	"Check whether there is evidence that method source is invalid"

	(theClass newParser parseSelector: sourceString asString) = aSelector
		ifFalse: [self informPossiblyCorruptSource].