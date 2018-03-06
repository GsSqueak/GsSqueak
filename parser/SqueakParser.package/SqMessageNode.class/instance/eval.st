equation translation
eval
	"When everything in me is a constant, I can produce a value. This is
	only used by the Scripting system (TilePadMorph tilesFrom:in:)"
	| rec args |
	receiver isVariableNode
		ifFalse: [^ #illegal].
	rec := receiver key value.
	args := arguments
				collect: [:each | each eval].
	^ rec perform: selector key withArguments: args