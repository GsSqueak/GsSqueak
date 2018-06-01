initialization
initialize

	| r full |
	super initialize.
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	borderWidth := 2.
	self listDirection: #topToBottom.
	recorder := SoundRecorder new.
	full := self addButtonRows.
	self addRecordLevelSliderIn: full.

	r := AlignmentMorph newRow vResizing: #shrinkWrap.
	r addMorphBack: (self makeRecordMeterIn: full).
	self addMorphBack: r.
	self extent: 10@10.  "make minimum size"
