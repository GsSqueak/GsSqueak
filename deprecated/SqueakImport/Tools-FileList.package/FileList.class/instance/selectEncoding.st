private
selectEncoding

	| encodingItems |
	encodingItems := OrderedCollection new.
	TextConverter allSubclasses do: [:each | | names |
		names := each encodingNames.
		names notEmpty ifTrue: [ | label |
			label := '' writeStream.
			names do: [:eachName | label nextPutAll: eachName ] separatedBy: [ label nextPutAll: ', '].
			encodingItems add: {label contents. names first asSymbol}.
		].
	].
	brevityState := UIManager default
		chooseFrom: (encodingItems collect: [:spec| spec first])
		values: (encodingItems collect: [:spec| spec last]).
	brevityState ifNil: [brevityState := #needToGetBrief].
