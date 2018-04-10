initialization
setDefaultParameters
	super setDefaultParameters.
	self
		font: (self userInterfaceTheme font
				ifNil: [TextStyle defaultFont]);
		
		setTextColor: (self userInterfaceTheme textColor
				ifNil: [Color black]).
	self
		wrapBorderColor: ((self userInterfaceTheme wrapBorderColorModifier
				ifNil: [[:c | c muchLighter alpha: 0.3]])
				value: self borderColor).
	self
		setProperty: #adornmentReadOnly
		toValue: (self userInterfaceTheme adornmentReadOnly
				ifNil: [Color black]);
		
		setProperty: #adornmentRefuse
		toValue: (self userInterfaceTheme adornmentRefuse
				ifNil: [Color tan]);
		
		setProperty: #adornmentConflict
		toValue: (self userInterfaceTheme adornmentConflict
				ifNil: [Color red]);
		
		setProperty: #adornmentDiff
		toValue: (self userInterfaceTheme adornmentDiff
				ifNil: [Color green]);
		
		setProperty: #adornmentNormalEdit
		toValue: (self userInterfaceTheme adornmentNormalEdit
				ifNil: [Color orange]);
		
		setProperty: #adornmentDiffEdit
		toValue: (self userInterfaceTheme adornmentDiffEdit
				ifNil: [Color yellow]).
	self
		setProperty: #frameAdornmentWidth
		toValue: (self userInterfaceTheme frameAdornmentWidth
				ifNil: [1]).
	textMorph
		caretColor: (self userInterfaceTheme caretColor
				ifNil: [Color red]);
		
		selectionColor: (self userInterfaceTheme selectionColor
				ifNil: [TranslucentColor
						r: 0.0
						g: 0.0
						b: 0.8
						alpha: 0.2]);
		
		unfocusedSelectionColor: ((self userInterfaceTheme unfocusedSelectionModifier
				ifNil: [[:c | Color gray: 0.9]])
				value: textMorph selectionColor)