accessing - icons
checkBoxOffColorized: aColor

	^ self checkBoxOff
		collectColors: [:c | aColor alpha: c alpha]