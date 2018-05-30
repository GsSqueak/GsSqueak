menu commands
chasePointers
	| selected  saved |
	self selectionIndex = 0 ifTrue: [^ self changed: #flash].
	selected := self selection.
	saved := self object.
	[self object: nil.
	(Smalltalk includesKey: #PointerFinder)
		ifTrue: [PointerFinder on: selected]
		ifFalse: [self inspectPointers]]
		ensure: [self object: saved]