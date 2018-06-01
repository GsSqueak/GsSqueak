initialization
setupMorphs
	|  |
	self initProgressMorph.
	self	
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #topCenter;
		listCentering: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent.

	self addMorphBack: self labelMorph.
	self addMorphBack: self subLabelMorph.
	self addMorphBack: self progress.

	self borderWidth: ((UserInterfaceTheme current get: #borderWidth for: SystemProgressMorph) ifNil: [2]).
	self borderColor: ((UserInterfaceTheme current get: #borderColor for: SystemProgressMorph) ifNil: [Color black]).

	self color: ((UserInterfaceTheme current get: #color for: SystemProgressMorph) ifNil: [Color veryLightGray]).
	self align: self fullBounds center with: Display boundingBox center
