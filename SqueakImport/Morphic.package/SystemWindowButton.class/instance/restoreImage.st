visual properties
restoreImage
	dimmed == true
		ifTrue: [self firstSubmorph form: self dimmedForm]
		ifFalse: [super restoreImage]
