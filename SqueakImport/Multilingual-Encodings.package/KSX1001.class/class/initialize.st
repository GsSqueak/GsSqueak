class initialization
initialize
"
	KSX1001 initialize
"

	CompoundTextSequence := String
				streamContents: 
					[:stream | 
					stream nextPut: Character escape.
					stream nextPut: $$.
					stream nextPut: $(.
					stream nextPut: $C]