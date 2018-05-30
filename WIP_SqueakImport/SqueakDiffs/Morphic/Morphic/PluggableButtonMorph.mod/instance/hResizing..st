layout-properties
hResizing: aSymbol
	"We adapt our minimum extent according to our resize behavior."
	
	self hResizing == aSymbol ifTrue: [^ self].
	super hResizing: aSymbol.
	self updateMinimumExtent.