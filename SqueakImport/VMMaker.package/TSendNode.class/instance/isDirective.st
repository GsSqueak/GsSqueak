testing
isDirective
	"Preprocessor directive, e.g. a cpp macro"

	^ {	#preprocessorExpression: .
		#isDefined:inSmalltalk:comment:ifTrue:ifFalse: .
		#isDefined:inSmalltalk:comment:ifTrue: .
		#isDefinedTrueExpression:inSmalltalk:comment:ifTrue:ifFalse: .
		#cPreprocessorDirective:
		} identityIncludes: selector