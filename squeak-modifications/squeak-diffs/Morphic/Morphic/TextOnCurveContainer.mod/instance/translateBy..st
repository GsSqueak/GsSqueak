transforming
translateBy: delta 
	textSegments isNil ifTrue: [^self].
	textSegments := textSegments collect: 
					[:ls | 
					Array 
						with: (ls first translateBy: delta)
						with: (ls second translateBy: delta)
						with: ls third]