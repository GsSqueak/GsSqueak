accessing
label
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := ''.
	self
		allMorphsDo: [:m | (m isKindOf: StringMorph)
				ifTrue: [_gsSqueakTemp_s := m contents]].
	^ _gsSqueakTemp_s