menus
collapse
	| _gsSqueakTemp_w _gsSqueakTemp_collapsedVersion _gsSqueakTemp_a |
	(_gsSqueakTemp_w := self world)
		ifNil: [^ self].
	_gsSqueakTemp_collapsedVersion := (self imageForm scaledToSize: 50 @ 50) asMorph.
	_gsSqueakTemp_collapsedVersion setProperty: #uncollapsedMorph toValue: self.
	_gsSqueakTemp_collapsedVersion
		on: #mouseUp
		send: #uncollapseSketch
		to: _gsSqueakTemp_collapsedVersion.
	_gsSqueakTemp_collapsedVersion setBalloonText: 'A collapsed version of ' , self name.
	self delete.
	_gsSqueakTemp_w addMorphFront: (_gsSqueakTemp_a := AlignmentMorph newRow hResizing: #shrinkWrap;
					 vResizing: #shrinkWrap;
					 borderWidth: 4;
					 borderColor: Color white;
					 addMorph: _gsSqueakTemp_collapsedVersion).
	_gsSqueakTemp_collapsedVersion setProperty: #collapsedMorphCarrier toValue: _gsSqueakTemp_a.
	(self
		valueOfProperty: #collapsedPosition
		ifAbsent: [])
		ifNotNil: [:_gsSqueakTemp_priorPosition | _gsSqueakTemp_a position: _gsSqueakTemp_priorPosition]