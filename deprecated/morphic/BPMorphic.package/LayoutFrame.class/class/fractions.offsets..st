instance creation
fractions: fractionsOrNil offsets: offsetsOrNil 
	| _gsSqueakTemp_fractions _gsSqueakTemp_offsets |
	_gsSqueakTemp_fractions := fractionsOrNil
				ifNil: [0 @ 0 extent: 0 @ 0].
	_gsSqueakTemp_offsets := offsetsOrNil
				ifNil: [0 @ 0 extent: 0 @ 0].
	^ self new topFraction: _gsSqueakTemp_fractions top offset: _gsSqueakTemp_offsets top;
		 leftFraction: _gsSqueakTemp_fractions left offset: _gsSqueakTemp_offsets left;
		 bottomFraction: _gsSqueakTemp_fractions bottom offset: _gsSqueakTemp_offsets bottom;
		 rightFraction: _gsSqueakTemp_fractions right offset: _gsSqueakTemp_offsets right