styling
setText: aText
	
	self okToStyle ifFalse:[^super setText: aText].
	super setText: (styler format: aText asText).
	aText size < 4096
		ifTrue:[styler style: textMorph contents]
		ifFalse:[styler styleInBackgroundProcess:  textMorph contents]