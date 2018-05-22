enter
isIncompletelyLoaded
	"Answer true if project is incomplete and should be loaded from server "

	(world isKindOf: StringMorph)
		ifTrue: [self inform: 'This project is not all here. I will try to load a complete version.' translated.
			^ true].
	^ false