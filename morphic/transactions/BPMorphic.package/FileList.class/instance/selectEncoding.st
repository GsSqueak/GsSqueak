private
selectEncoding
	| _gsSqueakTemp_encodingItems |
	_gsSqueakTemp_encodingItems := OrderedCollection new.
	TextConverter allSubclasses
		do: [:each | 
			| names |
			names := each encodingNames.
			names notEmpty
				ifTrue: [| label |
					label := '' writeStream.
					names
						do: [:eachName | label nextPutAll: eachName]
						separatedBy: [label nextPutAll: ', '].
					_gsSqueakTemp_encodingItems add: {label contents. names first asSymbol}]].
	brevityState := UIManager default
				chooseFrom: (_gsSqueakTemp_encodingItems
						collect: [:spec | spec first])
				values: (_gsSqueakTemp_encodingItems
						collect: [:spec | spec last]).
	brevityState
		ifNil: [brevityState := #needToGetBrief]