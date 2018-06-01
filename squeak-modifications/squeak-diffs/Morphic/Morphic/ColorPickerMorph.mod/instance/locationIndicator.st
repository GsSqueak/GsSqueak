accessing
locationIndicator
	
	^self valueOfProperty: #locationIndicator ifAbsent:[ | loc |
		loc := EllipseMorph new.
		loc color: Color transparent; 
			borderWidth: 1; 
			borderColor: Color red; 
			extent: 6@6.
		self setProperty: #locationIndicator toValue: loc.
		self addMorphFront: loc.
		loc]