constructing
createButton: buttonLabel 
	^ self
		createButton: buttonLabel
		value: self buttonRow submorphs size + 1
		color: self defaultButtonColor