running
startUp
	| className |
	className := self parameterAt: 'class'.
	ToolSet browse: (Smalltalk at: className asSymbol ifAbsent: [Object]) selector: nil