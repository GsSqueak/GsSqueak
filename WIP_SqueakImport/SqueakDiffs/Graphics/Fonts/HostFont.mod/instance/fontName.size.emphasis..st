private-creation
fontName: fontName size: ptSize emphasis: emphasisCode

	^ self fontName: fontName size: ptSize emphasis: emphasisCode rangesArray: (Array with: (Array with: 0 with: 255)).
