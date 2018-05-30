submorph access
searchPane
	"Answer the receiver's search pane, nil if none"

	^ self submorphNamed: 'SearchPane' ifNone: [].