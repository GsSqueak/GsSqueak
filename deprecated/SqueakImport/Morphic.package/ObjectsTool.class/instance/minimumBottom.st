layout
minimumBottom
	| iconsBottom partsBin |
	partsBin := self partsBin ifNil: [ ^self bottom ].
	iconsBottom := partsBin submorphs isEmpty
		ifTrue: [ partsBin top + 60 ]
		ifFalse: [ partsBin submorphBounds bottom + partsBin layoutInset ].

	^iconsBottom + self layoutInset + self borderWidth