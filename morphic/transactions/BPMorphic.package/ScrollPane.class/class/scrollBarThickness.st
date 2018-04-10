defaults
scrollBarThickness
	^ Preferences scrollBarsNarrow
		ifTrue: [10]
		ifFalse: [14]