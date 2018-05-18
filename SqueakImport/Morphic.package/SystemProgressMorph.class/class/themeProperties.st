preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the progress'' border.' }.
		{ #borderWidth. 'Borders'. 'Width of the progress'' border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the progress.' }.

		{ #font. 'Fonts'. 'Font for bar labels.' }.
		{ #textColor. 'Colors'. 'Color for bar labels.' }.
	}