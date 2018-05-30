menu
isCurrentlyTextual
	| first |
	^((first := submorphs first) isKindOf: StringMorph) 
		or: [first isTextMorph]