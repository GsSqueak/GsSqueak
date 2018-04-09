*SqCollectionLiterals-system primitives
numArgs: n
	"Answer a string that can be used as a selector with n arguments.
	 TODO: need to be extended to support shrinking and for selectors like #+ " 

	| numArgs offset |.
	(numArgs := self numArgs) >= n ifTrue: [ ^self ].
	numArgs = 0
		ifTrue: [ offset := 1 ]
		ifFalse: [ offset := 0 ].
	^(String new: n - numArgs + offset * 5 + offset + self size streamContents: [ :stream |
		stream nextPutAll: self.
		numArgs = 0 ifTrue: [ stream nextPut: $:. ].
		numArgs + offset + 1 to: n do: [ :i | stream nextPutAll: 'with:' ] ]) asSymbol
