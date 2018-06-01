other
makeMinimalControlsWithColor: aColor title: aString

	| aButton aColumn aRow but |
	aButton := SimpleButtonMorph new target: self; borderColor: Color black; 
				color: aColor; borderWidth: 0.
	aColumn := AlignmentMorph newColumn.
	aColumn color: aButton color; borderWidth: 0; layoutInset: 0.
	aColumn hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.

	aRow := AlignmentMorph newRow.
	aRow color: aButton color; borderWidth: 0; layoutInset: 0.
	aRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	aRow addTransparentSpacerOfSize: 40@0.
	aRow addMorphBack: (but := aButton label: ' < ' ; actionSelector: #previousPage).
		"copy is OK, since we just made it and it can't own any Players"
	but setBalloonText: 'Go to previous page'.
	aRow addTransparentSpacerOfSize: 82@0.
	aRow addMorphBack: (StringMorph contents: aString) lock.
	aRow addTransparentSpacerOfSize: 82@0.
	aButton := SimpleButtonMorph new target: self; borderColor: Color black; 
				color: aColor; borderWidth: 0.
	aRow addMorphBack: (but := aButton label: ' > ' ; actionSelector: #nextPage).
	but setBalloonText: 'Go to next page'.
	aRow addTransparentSpacerOfSize: 40@0.

	aColumn addMorphBack: aRow.

	aColumn setNameTo: 'Page Controls'.
	
	^ aColumn