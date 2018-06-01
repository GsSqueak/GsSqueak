initialization
addLabelArea
	labelArea
		ifNotNil: [labelArea abandon].
	labelArea := (AlignmentMorph newSpacer: Color transparent) vResizing: #spaceFill;
				 layoutPolicy: ProportionalLayout new.
	self addMorph: labelArea