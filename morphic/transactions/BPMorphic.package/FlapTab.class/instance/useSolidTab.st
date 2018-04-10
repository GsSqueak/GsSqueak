solid tabs
useSolidTab
	| _gsSqueakTemp_thickness _gsSqueakTemp_colorToUse |
	self preserveDetails.
	_gsSqueakTemp_thickness := self
				valueOfProperty: #priorThickness
				ifAbsent: [20].
	_gsSqueakTemp_colorToUse := self
				valueOfProperty: #priorColor
				ifAbsent: [Color red muchLighter].
	self color: _gsSqueakTemp_colorToUse.
	self removeAllMorphs.
	self orientation == #vertical
		ifTrue: [self width: _gsSqueakTemp_thickness.
			self height: self currentWorld height.
			self position: self position x @ 0]
		ifFalse: [self height: _gsSqueakTemp_thickness.
			self width: self currentWorld width.
			self position: 0 @ self position y].
	self borderWidth: 0.
	self layoutChanged