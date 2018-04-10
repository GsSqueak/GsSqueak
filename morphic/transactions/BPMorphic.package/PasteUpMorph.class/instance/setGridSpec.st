gridding
setGridSpec
	"Gridding rectangle provides origin and modulus"
	| response result |
	response := UIManager default request: 'New grid origin (usually 0@0):' translated initialAnswer: self gridOrigin printString.
	response isEmpty
		ifTrue: [^ self].
	result := [Compiler evaluate: response]
				ifError: [^ self].
	(result isPoint
			and: [result >= (0 @ 0)])
		ifTrue: [self gridOrigin: result]
		ifFalse: [self inform: 'Must be a Point with coordinates (for example 10@10)' translated].
	response := UIManager default request: 'New grid spacing:' translated initialAnswer: self gridModulus printString.
	response isEmpty
		ifTrue: [^ self].
	result := [Compiler evaluate: response]
				ifError: [^ self].
	(result isPoint
			and: [result > (0 @ 0)])
		ifTrue: [self gridModulus: result]
		ifFalse: [self inform: 'Must be a Point with coordinates (for example 10@10)' translated]