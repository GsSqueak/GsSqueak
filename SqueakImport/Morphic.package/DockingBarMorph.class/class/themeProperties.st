preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the menu''s border.' }.
		{ #borderWidth. 'Geometry'. 'Width of the menu''s border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the menu.' }.

		{ #lineColor. 'Colors'. 'Color of the separators between menu items.' }.
		{ #lineStyle. 'Colors'. 'Use border-style to change appearance.' }.
		{ #lineWidth. 'Geometry'. 'How big the separators should be.' }.
	}