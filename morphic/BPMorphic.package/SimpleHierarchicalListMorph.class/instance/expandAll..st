events
expandAll: aMorph 
	| _gsSqueakTemp_allChildren |
	aMorph toggleExpandedState.
	_gsSqueakTemp_allChildren := OrderedCollection new: 10.
	aMorph recursiveAddTo: _gsSqueakTemp_allChildren.
	_gsSqueakTemp_allChildren
		do: [:each | (each canExpand
					and: [each isExpanded not])
				ifTrue: [self expandAll: each]]