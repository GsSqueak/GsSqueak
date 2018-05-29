converting
evalStrings
	   "Allows you to construct literal arrays.
    #(true false nil '5@6' 'Set new' '''text string''') evalStrings
    gives an array with true, false, nil, a Point, a Set, and a String
    instead of just a bunch of Symbols"
    

    ^ self collect: [:each | | it |
        it := each.
        each == #true ifTrue: [it := true].
		      each == #false ifTrue: [it := false].
        each == #nil ifTrue: [it := nil].
        (each isString and:[each isSymbol not]) ifTrue: [
			it := Compiler evaluate: each].
        each class == Array ifTrue: [it := it evalStrings].
        it]
