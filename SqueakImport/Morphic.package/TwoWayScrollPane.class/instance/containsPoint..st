geometry testing
containsPoint: aPoint
	(super containsPoint: aPoint) ifTrue: [^ true].
	"Also include scrollbar when it is extended..."
	"used to handle retractable scrolbar"
	^ false