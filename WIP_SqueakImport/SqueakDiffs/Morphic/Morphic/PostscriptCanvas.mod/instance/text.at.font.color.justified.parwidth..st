private
text: s at:point font: fontOrNil color: c justified:justify parwidth:parwidth

	self flag: #bob.		"deprecated in favor of #textStyled......."







	self setFont:(fontOrNil ifNil:[self defaultFont]).
	self comment:' text color: ',c printString.
	self setColor:c.
	self comment:'  origin ',  origin printString.
     self moveto: point.
	target print:' (';
     	 print:s asPostscript; print:') '.
		justify ifTrue:[
			target write:parwidth; print:' jshow'; cr.
		] ifFalse:[
			target print:'show'.
		].
		target cr.
