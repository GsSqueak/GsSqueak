constructing
createAcceptButton
	^ self
		createButton: 'Accept' translated
		value: true
		color: (self userInterfaceTheme okColor
				ifNil: [Color
						r: 0.49
						g: 0.749
						b: 0.49])