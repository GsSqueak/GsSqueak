dropping/grabbing
justDroppedInto: aMorph event: evt 
	| _gsSqueakTemp_halo |
	super justDroppedInto: aMorph event: evt.
	_gsSqueakTemp_halo := evt hand halo.
	(_gsSqueakTemp_halo notNil
			and: [_gsSqueakTemp_halo target hasOwner: self])
		ifTrue: ["Grabbed single menu item"
			self addHalo: evt].
	stayUp
		ifFalse: [evt hand newMouseFocus: self].
	self hasDropShadow: Preferences menuAppearance3d