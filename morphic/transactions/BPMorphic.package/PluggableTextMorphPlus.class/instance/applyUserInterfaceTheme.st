updating
applyUserInterfaceTheme
	super applyUserInterfaceTheme.
	self styler
		ifNotNil: [:s | 
			s reset.
			self updateStyle]