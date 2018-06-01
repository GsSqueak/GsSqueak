initialization
asFlexOf: aMorph 
	"Initialize me with position and bounds of aMorph,
	and with an offset that provides centered rotation."
	| _gsSqueakTemp_pos |
	_gsSqueakTemp_pos := aMorph position.
	self addMorph: aMorph.
	aMorph position: (aMorph extent // 2) negated.
	self position: _gsSqueakTemp_pos.
	transform := transform withOffset: aMorph position - _gsSqueakTemp_pos