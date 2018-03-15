modal control
informUserAt: aPoint during: aBlock 
	"Add this menu to the Morphic world during the execution of the given
	block. "
	| _gsSqueakTemp_title _gsSqueakTemp_w |
	_gsSqueakTemp_title := self allMorphs
				detect: [:ea | ea hasProperty: #titleString].
	_gsSqueakTemp_title := _gsSqueakTemp_title submorphs first.
	self visible: false.
	_gsSqueakTemp_w := ActiveWorld.
	aBlock
		value: [:string | 
			self visible
				ifFalse: [_gsSqueakTemp_w addMorph: self centeredNear: aPoint.
					self visible: true].
			_gsSqueakTemp_title contents: string.
			self setConstrainedPosition: Sensor cursorPoint hangOut: false.
			self changed.
			_gsSqueakTemp_w displayWorld
			"show myself"].
	self delete.
	_gsSqueakTemp_w displayWorld