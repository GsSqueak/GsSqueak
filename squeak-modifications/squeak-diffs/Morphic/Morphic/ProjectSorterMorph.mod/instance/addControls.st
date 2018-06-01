initialization
addControls
	"Add the control bar at the top of the tool."

	| b r partsBinButton newButton aWrapper |
	newButton := ImageMorph new image: (self world project makeThumbnail scaledToSize: 48@36).
	newButton on: #mouseDown send: #insertNewProject: to: self.
	newButton setBalloonText: 'Make a new Project' translated.
	(partsBinButton := UpdatingThreePhaseButtonMorph checkBox)
		target: self;
		actionSelector: #togglePartsBinStatus;
		arguments: #();
		getSelector: #getPartsBinStatus.
	(r := AlignmentMorph newRow)
		color: Color transparent;
		borderWidth: 0;
		layoutInset: 0;
		cellInset: 10@0;
		wrapCentering: #center;
		cellPositioning: #leftCenter;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		extent: 5@5.
	b := SimpleButtonMorph new target: self; color: self defaultColor darker;
			borderColor: Color black.
	r addMorphBack: (self wrapperFor: (b label: 'Okay' translated font: ScriptingSystem fontForEToyButtons; actionSelector: #acceptSort)).
	b := SimpleButtonMorph new target: self; color: self defaultColor darker;
			borderColor: Color black.
	r addMorphBack: (self wrapperFor: (b label: 'Cancel' translated font: ScriptingSystem fontForEToyButtons; actionSelector: #delete));
		addTransparentSpacerOfSize: 8 @ 0;
		addMorphBack: (self wrapperFor: (newButton));
		addTransparentSpacerOfSize: 8 @ 0.

	aWrapper := AlignmentMorph newRow beTransparent.
	aWrapper cellInset: 0; layoutInset: 0; borderWidth: 0.
	aWrapper
		addMorphBack: (self wrapperFor: partsBinButton);
		addMorphBack: (self wrapperFor: (StringMorph contents: 'Parts bin' translated font: ScriptingSystem fontForEToyButtons) lock).
	r addMorphBack: aWrapper.

	self addMorphFront: r.
