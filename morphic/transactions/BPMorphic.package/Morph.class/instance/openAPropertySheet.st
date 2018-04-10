meta-actions
openAPropertySheet
	Smalltalk
		at: #ObjectPropertiesMorph
		ifPresent: [:aClass | ^ aClass basicNew targetMorph: self;
				 initialize;
				 openNearTarget].
	Beeper beep