accessing
comment: aString

	aString isEmpty
		ifTrue: [comment := nil]
		ifFalse: [comment := aString].
