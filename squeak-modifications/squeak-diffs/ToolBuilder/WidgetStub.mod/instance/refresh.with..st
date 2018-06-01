events
refresh: var with: value
	state 
		at: var 
		put: (value isSymbol
		 		ifTrue: [spec model perform: value]
				ifFalse: [value])