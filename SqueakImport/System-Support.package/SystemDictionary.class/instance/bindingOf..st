accessing
bindingOf: varName
	"SystemDictionary includes Symbols only"
	^super bindingOf: varName asSymbol