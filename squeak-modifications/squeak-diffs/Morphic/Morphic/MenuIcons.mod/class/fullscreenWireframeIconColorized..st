accessing - icons
fullscreenWireframeIconColorized: aColor

	^ self fullscreenWireframeIcon
		collectColors: [:c | aColor alpha: c alpha]