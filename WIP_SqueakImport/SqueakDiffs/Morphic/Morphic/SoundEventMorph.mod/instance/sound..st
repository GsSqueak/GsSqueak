accessing
sound: aSound

	sound := aSound.
	self setBalloonText: 'a sound of duration ',(sound duration printShowingMaxDecimalPlaces: 1),' seconds'.