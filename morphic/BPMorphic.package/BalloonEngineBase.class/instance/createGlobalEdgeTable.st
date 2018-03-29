GET processing
createGlobalEdgeTable
	"Create the global edge table"
	| _gsSqueakTemp_object _gsSqueakTemp_end |
	_gsSqueakTemp_object := 0.
	_gsSqueakTemp_end := objUsed.
	[_gsSqueakTemp_object < _gsSqueakTemp_end]
		whileTrue: ["Note: addEdgeToGET: may fail on insufficient space but that's
			not a problem here"
			(self isEdge: _gsSqueakTemp_object)
				ifTrue: ["Check if the edge starts below fillMaxY."
					(self edgeYValueOf: _gsSqueakTemp_object)
							>= self fillMaxYGet
						ifFalse: [self checkedAddEdgeToGET: _gsSqueakTemp_object]].
			_gsSqueakTemp_object := _gsSqueakTemp_object
						+ (self objectLengthOf: _gsSqueakTemp_object)]