drawing
fullDrawOn: aCanvas
	(aCanvas isVisible: self fullBounds) ifFalse:[^self].
	running ifFalse: [
		^aCanvas clipBy: (bounds translateBy: aCanvas origin)
				during:[:clippedCanvas| super fullDrawOn: clippedCanvas]].
	(aCanvas isVisible: self bounds) ifTrue:[aCanvas drawMorph: self].
