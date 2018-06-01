font list
selectedFontIndex: anIndex
	anIndex = 0 ifTrue: [^self].
	selectedFontIndex := anIndex.
	self changed: #selectedFontIndex.
	self changed: #selectedFontStyleIndex.
	self changed: #pointSizeList.
	self changed: #pointSizeIndex.
	self changed: #contents.