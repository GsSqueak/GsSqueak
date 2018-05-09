class initialization
initialize
"
	GB2312 initialize
"

	CompoundTextSequence := String
				streamContents: 
					[:stream | 
					stream nextPut: Character escape.
					stream nextPut: $$.
					stream nextPut: $(.
					stream nextPut: $A].
