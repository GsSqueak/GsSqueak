constants
grayScalePalette
	grayScalePalette ifNil: [
		grayScalePalette := (0 to: 255) collect: [:brightness | Color gray: brightness asFloat / 255.0].
		grayScalePalette at: 1 put: Color transparent].
	^ grayScalePalette