initialization
addControls
	"Add the control bar at the top of the tool."

	| bb r str aCheckbox aWrapper |
	r := AlignmentMorph newRow color: Color transparent; borderWidth: 0; layoutInset: 0.
	r wrapCentering: #center; cellPositioning: #leftCenter; 
			hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	bb := SimpleButtonMorph new target: self; borderColor: Color black.
	r addMorphBack: (self wrapperFor: (bb label: 'Okay' translated font: ScriptingSystem fontForEToyButtons;	actionSelector: #acceptSort)).
	bb setBalloonText: 'Accept the changes made here as the new page-order for this book' translated.
	r addTransparentSpacerOfSize: 12.
	bb := SimpleButtonMorph new target: self; borderColor: Color black.
	r addMorphBack: (self wrapperFor: (bb label: 'Cancel' translated font: ScriptingSystem fontForEToyButtons;	actionSelector: #delete)).
	bb setBalloonText: 'Forgot any changes made here, and dismiss this sorter' translated.

	"eliminate the parts-bin button on the book-page sorters...
	r addTransparentSpacerOfSize: 24 @ 0.

	aCheckbox :=  UpdatingThreePhaseButtonMorph checkBox.
	aCheckbox 
		target: self;
		actionSelector: #togglePartsBinStatus;
		arguments: #();
		getSelector: #getPartsBinStatus.
	str := StringMorph contents: 'Parts bin' translated font: ScriptingSystem fontForEToyButtons.
	aWrapper := AlignmentMorph newRow beTransparent.
	aWrapper cellInset: 0; layoutInset: 0; borderWidth: 0.
	aWrapper
		addMorphBack: (self wrapperFor: aCheckbox);
		addMorphBack: (self wrapperFor: str lock).
	r addMorphBack: aWrapper."

	self addMorphFront: r
