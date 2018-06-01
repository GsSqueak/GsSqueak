other
makeRecordMeterIn: aPoint

	| outerBox h |
	h := (aPoint y * 0.6) asInteger.
	outerBox := Morph new extent: (aPoint x) asInteger@h; color: Color gray.
	recordMeter := Morph new extent: 1@h; color: Color yellow.
	recordMeter position: outerBox topLeft + (1@1).
	outerBox addMorph: recordMeter.
	^ outerBox
