preferences
themeProperties

	^ super themeProperties, {	
		{ #borderColorModifier. 'Colors'. 'How to derive the borderColor from the window color.' }.
		{ #borderWidth. 'Borders'. 'Width of the menu''s border.' }.
		{ #titleFont. 'Fonts'. 'Font of the window title.' }.
		
		{ #unfocusedWindowColorModifier. 'Colors'. 'A block with one argument that modifies a color to look unfocused.' }.
		{ #unfocusedLabelColor. 'Colors'. 'Window title color when window has no focus.'}.
		{ #focusedLabelColor. 'Colors'. 'Window title color when window has focus.'}.
		
		{ #color. 'Colors'. 'Color to use if the model or the pane morphs do not provide one.' }.
	}