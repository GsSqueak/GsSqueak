initialization
initializeFor: aTarget withForms: formList coexist: aBoolean 
	"World primaryHand attachMorph:
		(GraphicalMenu new initializeFor: nil  
		withForms: Form allInstances coexist: true)"
	| buttons bb anIndex buttonCage |
	target := aTarget.
	coexistWithOriginal := aBoolean.
	formChoices := formList.
	currentIndex := 1.
	self borderWidth: 1;
		 cellPositioning: #center;
		 color: Color white;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap.
	buttons := AlignmentMorph newRow.
	buttons borderWidth: 0;
		 layoutInset: 0.
	buttons hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	buttons wrapCentering: #topLeft.
	buttonCage := AlignmentMorph newColumn.
	buttonCage hResizing: #shrinkWrap;
		 vResizing: #spaceFill.
	buttonCage addTransparentSpacerOfSize: 0 @ 10.
	bb := SimpleButtonMorph new target: self;
				 borderColor: Color black.
	buttons addMorphBack: (bb label: 'Prev' translated;
			 actionSelector: #downArrowHit;
			 actWhen: #whilePressed).
	buttons addTransparentSpacerOfSize: 9 @ 0.
	bb := SimpleButtonMorph new target: self;
				 borderColor: Color black.
	buttons addMorphBack: (bb label: 'Next' translated;
			 actionSelector: #upArrowHit;
			 actWhen: #whilePressed).
	buttons addTransparentSpacerOfSize: 5 @ 0.
	buttons submorphs last color: Color white.
	buttonCage addMorphBack: buttons.
	buttonCage addTransparentSpacerOfSize: 0 @ 12.
	buttons := AlignmentMorph newRow.
	bb := SimpleButtonMorph new target: self;
				 borderColor: Color black.
	buttons addMorphBack: (bb label: 'OK' translated;
			 actionSelector: #okay).
	buttons addTransparentSpacerOfSize: 5 @ 0.
	bb := SimpleButtonMorph new target: self;
				 borderColor: Color black.
	buttons addMorphBack: (bb label: 'Cancel' translated;
			 actionSelector: #cancel).
	buttonCage addMorphBack: buttons.
	buttonCage addTransparentSpacerOfSize: 0 @ 10.
	self addMorphFront: buttonCage.
	formDisplayMorph := Thumbnail new extent: 100 @ 100;
				 maxWidth: 100 minHeight: 30;
				 yourself.
	self addMorphBack: (Morph new color: Color white;
			 layoutPolicy: TableLayout new;
			 layoutInset: 4 @ 4;
			 hResizing: #spaceFill;
			 vResizing: #spaceFill;
			 listCentering: #center;
			 addMorphBack: formDisplayMorph;
			 yourself).
	target
		ifNotNil: [(anIndex := formList
						indexOf: target form
						ifAbsent: [])
				ifNotNil: [currentIndex := anIndex]].
	self updateThumbnail