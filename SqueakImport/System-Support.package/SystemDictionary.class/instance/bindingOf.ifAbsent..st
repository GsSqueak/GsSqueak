accessing
bindingOf: varName ifAbsent: aBlock
	"SystemDictionary includes Symbols only"
	^super bindingOf: varName asSymbol ifAbsent: aBlock