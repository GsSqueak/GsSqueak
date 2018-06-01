private
textStyled: s at: ignored0 font: ignored1 color: c justified: justify parwidth: parwidth 
	| fillC oldC |
	fillC := c.
	self shadowColor
		ifNotNil: [:sc | 
			self comment: ' shadow color: ' , sc printString.
			fillC := sc].
	self comment: ' text color: ' , c printString.
	oldC := currentColor.
	self setColor: fillC.
	self comment: '  origin ' , origin printString.
	"self moveto: point."
	"now done by sender"
	target print: ' (';
		 print: s asPostscript;
		 print: ') '.
	justify
		ifTrue: [target write: parwidth;
				 print: ' jshow';
				 cr]
		ifFalse: [target print: 'show'].
	target cr.
	self setColor: oldC.