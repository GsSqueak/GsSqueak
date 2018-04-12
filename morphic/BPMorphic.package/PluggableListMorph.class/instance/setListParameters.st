initialization
setListParameters
	self listMorph
		selectionColor: (self userInterfaceTheme selectionColor
				ifNil: [Color
						r: 0.72
						g: 0.72
						b: 0.9]);
		
		multiSelectionColor: (self userInterfaceTheme multiSelectionColor
				ifNil: [(Color
						r: 0.72
						g: 0.72
						b: 0.9) lighter]);
		
		setProperty: #selectionTextColor
		toValue: (self userInterfaceTheme selectionTextColor
				ifNil: [Color black]);
		
		filterColor: (self userInterfaceTheme filterColor
				ifNil: [Color yellow paler]);
		
		setProperty: #filterTextColor
		toValue: (self userInterfaceTheme filterTextColor
				ifNil: [Color black]);
		
		setProperty: #preSelectionColor
		toValue: ((self userInterfaceTheme preSelectionModifier
				ifNil: [[:c | Color gray: 0.9]])
				value: self listMorph selectionColor asColor);
		
		setProperty: #hoverColor
		toValue: ((self userInterfaceTheme hoverSelectionModifier
				ifNil: [[:c | c darker alpha: 0.3]])
				value: self listMorph selectionColor asColor)