drawing
areasRemainingToFill: aRectangle
	color isTranslucent
		ifTrue: [^ Array with: aRectangle]
		ifFalse: [^ aRectangle areasOutside: self bounds]