search
doSearch: aSearchString
	
	| normalizedSearchString |
	normalizedSearchString := aSearchString asString copyWithout: Character space.
		
	Cursor wait showWhile: [
		self selectorList: (self computeSelectorListFrom: normalizedSearchString)].
	
	^ true