layout-properties
vResizing: aSymbol 
	"We adapt our minimum extent according to our resize behavior."
	self vResizing == aSymbol
		ifTrue: [^ self].
	super vResizing: aSymbol.
	self updateMinimumExtent