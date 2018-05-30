other
makeRecordMeter

	| outerBox |
	outerBox := Morph new extent: 102@18; color: Color gray.
	recordMeter := Morph new extent: 1@16; color: Color yellow.
	recordMeter position: outerBox topLeft + (1@1).
	outerBox addMorph: recordMeter.
	^ outerBox
