accessing
hasFocus

	^ super hasFocus or: [textMorph notNil and: [textMorph hasKeyboardFocus]]