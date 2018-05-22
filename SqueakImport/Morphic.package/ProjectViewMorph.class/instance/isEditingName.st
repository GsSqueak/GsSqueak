drawing
isEditingName

	| nameMorph |
	nameMorph := self findA: UpdatingStringMorph.
	nameMorph ifNil: [^false].

	^nameMorph hasFocus
