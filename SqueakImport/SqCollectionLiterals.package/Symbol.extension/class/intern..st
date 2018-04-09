*SqCollectionLiterals-instance creation
intern: aStringOrSymbol 

	| originalNewSymbols |
	originalNewSymbols := NewSymbols.
	^(self lookup: aStringOrSymbol) ifNil:[
		| aClass aSymbol newNewSymbols |
		aStringOrSymbol isSymbol ifTrue:[
			aSymbol := aStringOrSymbol.
		] ifFalse:[
			aClass := aStringOrSymbol isOctetString ifTrue:[ByteSymbol] ifFalse:[WideSymbol].
			aSymbol := aClass new: aStringOrSymbol size.
			aSymbol string: aStringOrSymbol.
		].
		newNewSymbols := originalNewSymbols copyWith: aSymbol.
		originalNewSymbols == NewSymbols
			ifTrue: [
				NewSymbols := newNewSymbols.
				newNewSymbols size > 1000 ifTrue: [ self condenseNewSymbols ].
				aSymbol ]
			ifFalse: [
				"Some other process has modified the symbols. Try again."
				self intern: aStringOrSymbol ] ]
