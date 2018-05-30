layout
doLayoutIn: layoutBounds
	"layout has changed. update scroll deltas or whatever else"

	(owner notNil and: [owner hasProperty: #autoFitContents])
		ifTrue: [self fitContents].
	super doLayoutIn: layoutBounds.