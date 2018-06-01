drawing-text
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c 
	| fillC oldC |
	fillC := self shadowColor
		ifNil: [c].
	self setFont: (fontOrNil
				ifNil: [self defaultFont]).
	self comment: ' text color: ' , c printString.
	oldC := currentColor.
	self setColor: fillC.
	self comment: ' boundsrect origin ' , boundsRect origin printString.
	self comment: '  origin ' , origin printString.
	self moveto: boundsRect origin.
	target print: ' (';
		 print: (s asString copyFrom: firstIndex to: lastIndex) asPostscript;
		 print: ') show';
		 cr.
	self setColor: oldC.