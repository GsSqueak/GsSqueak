balloon compatibility
drawOval: r color: c borderWidth: borderWidth borderColor: borderColor
	| fillC |
	fillC := self shadowColor ifNil:[c].
	^ self fillOval: r color: fillC borderWidth: borderWidth borderColor: borderColor
	

		
