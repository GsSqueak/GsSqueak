accessing
adoptPaneColor: aColor 
	super adoptPaneColor: aColor.
	self
		wrapBorderColor: ((self userInterfaceTheme wrapBorderColorModifier
				ifNil: [[:c | c muchLighter alpha: 0.3]])
				value: self borderColor)