as yet unclassified
addText: aString

	| t |
	t := TextMorph new 
		beAllFont: (TextStyle default fontOfSize: 26);
		contents: aString.
	self extent: t extent * 3.
	innerArea := Morph new 
		color: Color white; 
		extent: self extent - (16@16);
		position: self position + (8@8);
		lock.
	self addMorph: innerArea. 
	self addMorph: (t position: self position + t extent; lock).