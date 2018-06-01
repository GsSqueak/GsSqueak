button commands
changeCodec: aClass name: aString 
	| button newLabel |
	(aClass notNil
			and: [aClass isAvailable])
		ifTrue: [recorder codec: aClass new.
			newLabel := aString]
		ifFalse: [newLabel := 'None'].
	self submorphs
		do: [:raw | raw submorphs
				do: [:each | ((each isKindOf: SimpleButtonMorph)
							and: [each actionSelector = #chooseCodec])
						ifTrue: [button := each]]].
	button labelString: newLabel