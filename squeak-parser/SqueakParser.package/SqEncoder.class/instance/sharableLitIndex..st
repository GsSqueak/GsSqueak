encoding
sharableLitIndex: literal 
	"Special access prevents multiple entries for post-allocated super send
	special selectors"
	1
		to: literalStream position
		do: [:index | (literal
					literalEqual: (literalStream originalContents at: index))
				ifTrue: [^ index - 1]].
	^ self litIndex: literal