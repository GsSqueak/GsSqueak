preferences
themeProperties

	^ super themeProperties, {
		{ #font. 'Fonts'. 'Font of the list items.' }.
		{ #textColor. 'Colors'. 'Color of the list items.' }.
		{ #selectionColor. 'Colors'. 'Color used for items when hovering or selecting them.' }.
		{ #multiSelectionColor. 'Colors'. 'Colors used for items that are selected among others.'}.
		{ #selectionTextColor. 'Colors'. 'Color used for label when hovering or selecting them.' }.
		{ #filterColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		{ #filterTextColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		
		{ #preSelectionModifier. 'Colors'. 'How to derive the pre-selection color from the selection color.'}.
		{ #hoverSelectionModifier. 'Colors'. 'How to derive the hover color from the selection color.'}.
	}