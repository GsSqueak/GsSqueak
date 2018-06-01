private
text: s at: point font: fontOrNil color: c spacePad: pad 
	| fillC oldC |
	fillC := self shadowColor
				ifNil: [c].
	self
		setFont: (fontOrNil
				ifNil: [self defaultFont]).
	self comment: ' text color: ' , c printString.
	oldC := currentColor.
	self setColor: fillC.
	self comment: '  origin ' , origin printString.
	self moveto: point.
	target write: pad;
		 print: ' 0 32 (';
		 print: s asPostscript;
		 print: ') widthshow';
		 cr.
	self setColor: oldC.