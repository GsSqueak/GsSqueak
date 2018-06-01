installing
installAsTextStyle  "FontSetNewYork installAsTextStyle"
	| selectors |
	(TextConstants includesKey: self fontName) ifTrue:
		[(self confirm: 
self fontName , ' is already defined in TextConstants.
Do you want to replace that definition?')
			ifFalse: [^ self]].
	selectors := (self class selectors select: [:s | s beginsWith: 'size']) sort
		 replace: [:each | self perform: each].
	TextConstants
		at: self fontName
		put: (TextStyle fontArray: selectors)