as yet unclassified
inARightColumn: aCollectionOfMorphs 
	| col |
	col := AlignmentMorph newColumn color: Color transparent;
				 vResizing: #shrinkWrap;
				 layoutInset: 1;
				 wrapCentering: #bottomRight;
				 cellPositioning: #topCenter.
	aCollectionOfMorphs
		do: [:each | col addMorphBack: each].
	^ col