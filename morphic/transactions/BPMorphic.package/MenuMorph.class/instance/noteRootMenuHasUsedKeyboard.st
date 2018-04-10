keystroke helpers
noteRootMenuHasUsedKeyboard
	(self rootMenu hasProperty: #hasUsedKeyboard)
		ifFalse: [self setProperty: #hasUsedKeyboard toValue: true.
			self changed]