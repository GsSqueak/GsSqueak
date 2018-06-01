accessing - icons
radioButtonPressedColorized: aColor

	^ self radioButtonPressed
		collectColors: [:c | aColor alpha: c alpha]