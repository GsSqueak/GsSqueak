inlining
inlineReturnType: selector
	"gets the return type of a given inline selector"

	^inlineReturnTypes ifNotNilDo: [ :types | types at: selector ifAbsent: nil ]