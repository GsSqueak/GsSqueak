menu commands
explorePointers
	self selectionIndex = 0 ifTrue: [^ self changed: #flash].
	PointerExplorer openOn: self selection.