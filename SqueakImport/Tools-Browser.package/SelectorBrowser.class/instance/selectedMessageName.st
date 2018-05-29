accessing
selectedMessageName
	"Answer the name of the currently selected message."

	| example tokens |
	selectorIndex = 0 ifTrue: [^nil].
	example := selectorList at: selectorIndex.
	tokens := Scanner new scanTokens: example.
	tokens size = 1 ifTrue: [^ tokens first].
	tokens first == #'^' ifTrue: [^ nil].
	(tokens second includes: $:) ifTrue: [^ example findSelector].
	Symbol hasInterned: tokens second ifTrue: [:aSymbol | ^ aSymbol].
	^ nil