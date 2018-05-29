submorph access
buttonPane
	"Answer the receiver's button pane, nil if none"

	^ self submorphNamed: 'ButtonPane' ifNone: [].