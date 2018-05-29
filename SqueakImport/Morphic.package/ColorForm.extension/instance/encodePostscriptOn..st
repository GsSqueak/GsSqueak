*Morphic-MorphicExtras-*morphic-Postscript Canvases
encodePostscriptOn: aStream 
	self unhibernate.
	aStream print: '% form contains ';
	 write: (colors select: [:c | c = Color transparent]) size;
	 print: ' transparent colors';
	 cr.
	^ self asFormWithSingleTransparentColors 
		printPostscript: aStream operator: (self depth = 1
			ifTrue: ['imagemask']
			ifFalse: [(self indexOfColor: Color transparent) printString , ' transparentimage'])