accessing
highlight
	| str |
	isHighlighted := true.
	submorphs notEmpty 
		ifTrue: 
			[((str := submorphs first) isKindOf: StringMorph) 
				ifTrue: [str color: self highlightColor]
				ifFalse: 
					[self
						borderWidth: 1;
						borderColor: self highlightColor]]