accessing - icons
checkBoxOnColorized: aColor

	^ self checkBoxOn
		collectColors: [:c | aColor alpha: c alpha]