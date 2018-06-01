accessing - icons
radioButtonOnColorized: aColor

	^ self radioButtonOn
		collectColors: [:c | aColor alpha: c alpha]