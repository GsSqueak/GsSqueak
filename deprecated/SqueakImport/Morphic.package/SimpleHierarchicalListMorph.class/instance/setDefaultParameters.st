initialization
setDefaultParameters

	super setDefaultParameters.
	
	self
		font: (self userInterfaceTheme font ifNil: [TextStyle defaultFont]);
		textColor: (self userInterfaceTheme textColor ifNil: [Color black]).
		
	self
		selectionColor: (self userInterfaceTheme selectionColor ifNil: [Color r: 0.72 g: 0.72 b: 0.9]);
		selectionTextColor: (self userInterfaceTheme selectionTextColor ifNil: [Color black]);
		filterColor: (self userInterfaceTheme filterColor ifNil: [Color yellow paler]);
		filterTextColor: (self userInterfaceTheme filterTextColor ifNil: [Color black]);
		lineColor: (self userInterfaceTheme lineColor ifNil: [Color veryLightGray]);
		hoverColor: ((self userInterfaceTheme hoverSelectionModifier ifNil: [ [:c | c darker alpha: 0.3] ]) value: self selectionColor);
		highlightTextColor: (self userInterfaceTheme highlightTextColor ifNil: [Color red]).