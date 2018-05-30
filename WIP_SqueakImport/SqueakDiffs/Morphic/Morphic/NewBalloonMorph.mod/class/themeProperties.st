preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the balloon''s border.' }.
		{ #borderWidth. 'Borders'. 'Width of the balloon''s border.' }.
		{ #color. 'Colors', 'Color for the balloon background.' }.
		{ #font. 'Fonts'. 'Font for balloon text if not overridden by text attributes.' }.
		{ #textColor. 'Colors'. 'Color for the balloon text if not overridden by text attributes.' }.
	}