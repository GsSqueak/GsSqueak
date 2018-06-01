accessing - icons
checkBoxPressedColorized: aColor

	^ self checkBoxPressed
		collectColors: [:c | aColor alpha: c alpha]