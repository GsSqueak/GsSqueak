panes
addMorph: aMorph frame: relFrame 
	| _gsSqueakTemp_frame |
	_gsSqueakTemp_frame := LayoutFrame new.
	_gsSqueakTemp_frame leftFraction: relFrame left;
		 rightFraction: relFrame right;
		 topFraction: relFrame top;
		 bottomFraction: relFrame bottom.
	self addMorph: aMorph fullFrame: _gsSqueakTemp_frame