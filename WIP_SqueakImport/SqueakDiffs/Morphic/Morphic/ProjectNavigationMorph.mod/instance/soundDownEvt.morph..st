*Morphic-MorphicExtras-Sound
soundDownEvt: a morph: b

	soundSlider ifNotNil: [soundSlider delete].
	(soundSlider := RectangleMorph new)
		setProperty: #morphicLayerNumber toValue: 1;
		extent: b width @ (b width * 3);
		color: self colorForButtons;
		borderColor: #raised;
		bottomLeft: b boundsInWorld origin.
	soundSlider addMorph: (
		RectangleMorph new
			color: self colorForButtons;
			borderColor: #raised;
			extent: b width @ 8;
			center: soundSlider center x @ 
				(soundSlider bottom - (soundSlider height * self getSoundVolume) asInteger)
	).
	soundSlider openInWorld.