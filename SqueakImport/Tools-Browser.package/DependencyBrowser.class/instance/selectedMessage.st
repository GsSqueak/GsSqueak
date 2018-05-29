contents
selectedMessage
	"Source code for currently selected message"
	| className methodName mref |
	className := self classListSelection.
	methodName := self messageListSelection.
	mref := (classDeps at: self classDepsSelection ifAbsent:[#()])
		detect:[:mr| mr actualClass name = className 
						and:[mr methodSymbol = methodName]]
		ifNone:[nil].
	mref ifNil:[^self class comment].
	mref methodSymbol == #Definition ifTrue:[^mref actualClass definition].
	^mref sourceCode