updating
updateFillStyle: evt

	self
		updateFillStylePressing: (evt redButtonPressed and: [self containsPoint: evt position])
		hovering: (evt redButtonPressed not and: [self containsPoint: evt position]).