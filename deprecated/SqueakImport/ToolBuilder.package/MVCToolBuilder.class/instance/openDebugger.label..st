opening
openDebugger: anObject label: aString
	"Build an open the object, labeling it appropriately.  Answer the widget opened."
	| window |
	window := self build: anObject.
	window label: aString.
	window controller openNoTerminate.
	^window