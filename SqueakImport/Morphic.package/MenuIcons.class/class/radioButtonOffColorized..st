accessing - icons
radioButtonOffColorized: aColor

	^ self radioButtonOff
		collectColors: [:c | aColor alpha: c alpha]