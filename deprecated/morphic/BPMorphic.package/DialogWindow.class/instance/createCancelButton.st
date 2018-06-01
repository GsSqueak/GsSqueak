constructing
createCancelButton
	^ cancelButton := self
				createButton: 'Cancel' translated
				value: false
				color: (self userInterfaceTheme cancelColor
						ifNil: [Color
								r: 1
								g: 0.6
								b: 0.588])