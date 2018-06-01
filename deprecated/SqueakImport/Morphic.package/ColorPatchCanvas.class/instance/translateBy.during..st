drawing-support
translateBy: delta during: aBlock
	"Set a translation only during the execution of aBlock."
	| tempCanvas |
	tempCanvas := self copyOffset: delta.
	aBlock value: tempCanvas.
	foundMorph := tempCanvas foundMorph.