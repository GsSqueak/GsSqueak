preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the menu''s border.' }.
		{ #borderWidth. 'Borders'. 'Width of the menu''s border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the menu.' }.

		{ #titleBorderColor. 'Colors'. 'Color of the menu title border.' }.
		{ #titleBorderWidth. 'Geometry'. 'Width of the menu title border.' }.
		{ #titleBorderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset for the title.' }.
		{ #titleColor. 'Colors'. 'Background color of the menu'' title.' }.
		{ #titleFont. 'Fonts'. 'Font for menu title.' }.
		{ #titleTextColor. 'Colors'. 'Color for the menu title label.' }.

		{ #lineColor. 'Colors'. 'Color of the separators between menu items.' }.
		{ #lineStyle. 'Colors'. 'Use border-style to change appearance.' }.
		{ #lineWidth. 'Geometry'. 'How big the separators should be.' }.
	}