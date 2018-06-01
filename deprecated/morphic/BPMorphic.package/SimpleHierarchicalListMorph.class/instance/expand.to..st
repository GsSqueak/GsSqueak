events
expand: aMorph to: level 
	| _gsSqueakTemp_allChildren |
	aMorph toggleExpandedState.
	_gsSqueakTemp_allChildren := OrderedCollection new: 10.
	aMorph recursiveAddTo: _gsSqueakTemp_allChildren.
	_gsSqueakTemp_allChildren
		do: [:each | ((each canExpand
						and: [each isExpanded not])
					and: [level > 0])
				ifTrue: [self expand: each to: level - 1]]