events
expandAll
	(selectedMorph isNil
			or: [selectedMorph isExpanded])
		ifTrue: [^ self].
	self expandAll: selectedMorph.
	self adjustSubmorphPositions