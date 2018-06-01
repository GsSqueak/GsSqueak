menu
isCurrentlyTextual
	| first |
	^submorphs notEmpty and: 
			[((first := submorphs first) isKindOf: StringMorph) 
				or: [first isTextMorph]]