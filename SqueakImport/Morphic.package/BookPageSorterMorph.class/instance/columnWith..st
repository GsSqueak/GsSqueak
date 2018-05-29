as yet unclassified
columnWith: aMorph

	^AlignmentMorph newColumn
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		wrapCentering: #center;
		cellPositioning: #topCenter;
		layoutInset: 1;
		addMorph: aMorph
