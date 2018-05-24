drawing
drawKeyboardFocusIndicationOn: aCanvas

	self wantsRoundedCorners
		ifTrue: [aCanvas frameRoundRect: self bounds radius: self cornerRadius width: self keyboardFocusWidth color: self keyboardFocusColor]
		ifFalse: [aCanvas frameRectangle: self bounds width: self keyboardFocusWidth color: self keyboardFocusColor].