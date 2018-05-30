accessing
unHighlight
	| str |
	isHighlighted := false.
	self borderWidth: 0.
	submorphs notEmpty 
		ifTrue: 
			[((str := submorphs first) isKindOf: StringMorph orOf: RectangleMorph) 
				ifTrue: [str color: self regularColor]]