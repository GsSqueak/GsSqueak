event handling
mouseDown: evt

	oldColor := color.
	actWhen == #buttonDown
		ifTrue: [self doButtonAction].
