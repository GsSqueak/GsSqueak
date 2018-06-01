-Morphic-Sound-piano rolls
justDroppedIntoPianoRoll: pianoRoll event: evt 
	| _gsSqueakTemp_ambientEvent _gsSqueakTemp_startTimeInScore |
	_gsSqueakTemp_startTimeInScore := pianoRoll timeForX: self left.
	_gsSqueakTemp_ambientEvent := AmbientEvent new morph: self;
				 time: _gsSqueakTemp_startTimeInScore.
	pianoRoll score addAmbientEvent: _gsSqueakTemp_ambientEvent