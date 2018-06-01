solid tabs
useSolidTab
	| thickness colorToUse |
	self preserveDetails.

	thickness := self valueOfProperty: #priorThickness ifAbsent: [20].
	colorToUse := self valueOfProperty: #priorColor ifAbsent: [Color red muchLighter].
	self color: colorToUse.
	self removeAllMorphs.
	
	(self orientation == #vertical)
		ifTrue:
			[self width: thickness.
			self height: self currentWorld height.
			self position: (self position x @ 0)]
		ifFalse:
			[self height: thickness.
			self width: self currentWorld width.
			self position: (0 @ self position y)].

	self borderWidth: 0.
	self layoutChanged.