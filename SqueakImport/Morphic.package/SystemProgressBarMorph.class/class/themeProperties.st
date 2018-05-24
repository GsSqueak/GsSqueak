preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the progress bar''s border.' }.
		{ #borderWidth. 'Borders'. 'Width of the progress bar''s border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the progress bar.' }.
		{ #barColor. 'Colors'. 'Color of the progress bar''s bar.' }.
	}