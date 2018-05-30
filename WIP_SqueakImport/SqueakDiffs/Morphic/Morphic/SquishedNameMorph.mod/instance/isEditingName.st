drawing
isEditingName

	^((self findA: UpdatingStringMorph) ifNil: [^false]) hasFocus
