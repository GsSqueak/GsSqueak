event handling
actOnClickFor: aMessageSet
	"Add to the end of the list.  'aClass selector', 'aClass Comment', 'aClass Definition', 'aClass Hierarchy' are the formats allowed."

	aMessageSet addItem: classAndMethod.
	^ true