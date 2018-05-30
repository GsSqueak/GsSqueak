submorph access
tabsPane
	"Answer the receiver's tabs pane, nil if none"

	^ self submorphNamed: 'TabPane' ifNone: [].