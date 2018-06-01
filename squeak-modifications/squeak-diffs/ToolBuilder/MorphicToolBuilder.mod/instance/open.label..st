opening
open: anObject label: aString
	"Build an open the object, labeling it appropriately if it is a window. Answer the widget opened."
	
	| morph |
	morph := self open: anObject.
	morph isSystemWindow
		ifTrue: [morph setLabel: aString]
		ifFalse: [morph name: aString].
	^ morph