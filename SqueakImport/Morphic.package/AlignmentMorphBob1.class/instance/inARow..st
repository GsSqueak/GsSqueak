as yet unclassified
inARow: aCollectionOfMorphs 
	| row |
	row := AlignmentMorph newRow color: Color transparent;
				 vResizing: #shrinkWrap;
				 layoutInset: 2;
				 wrapCentering: #center;
				 cellPositioning: #leftCenter.
	aCollectionOfMorphs
		do: [:each | each ifNotNil: [row addMorphBack: each]].
	^ row