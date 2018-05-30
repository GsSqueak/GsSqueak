style list
selectedFontStyleIndex: anIndex
	anIndex = 0 ifTrue: [^self].
	emphasis := anIndex - 1.
	self changed: #selectedFontStyleIndex.
	self changed: #contents.