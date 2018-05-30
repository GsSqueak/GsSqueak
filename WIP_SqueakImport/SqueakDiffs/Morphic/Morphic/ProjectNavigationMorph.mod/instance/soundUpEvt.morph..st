*Morphic-MorphicExtras-Sound
soundUpEvt: a morph: b

	soundSlider ifNotNil: [soundSlider delete].
	soundSlider := nil.
	Beeper beep 