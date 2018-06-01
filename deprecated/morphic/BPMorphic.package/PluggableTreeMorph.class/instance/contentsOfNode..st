node access
contentsOfNode: node 
	| _gsSqueakTemp_children |
	getChildrenSelector
		ifNil: [^ #()].
	_gsSqueakTemp_children := model perform: getChildrenSelector with: node item.
	^ self nodesForChildren: _gsSqueakTemp_children inNode: node