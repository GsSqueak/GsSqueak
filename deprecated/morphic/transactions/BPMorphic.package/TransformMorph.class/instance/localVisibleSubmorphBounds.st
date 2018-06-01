geometry
localVisibleSubmorphBounds
	"Answer, in my coordinate system, the bounds of all my visible
	submorphs (or nil if no visible submorphs)"
	| _gsSqueakTemp_subBounds |
	_gsSqueakTemp_subBounds := nil.
	self
		submorphsDo: [:m | m visible
				ifTrue: [_gsSqueakTemp_subBounds
						ifNil: [_gsSqueakTemp_subBounds := m fullBounds copy]
						ifNotNil: [_gsSqueakTemp_subBounds := _gsSqueakTemp_subBounds quickMerge: m fullBounds]]].
	^ _gsSqueakTemp_subBounds