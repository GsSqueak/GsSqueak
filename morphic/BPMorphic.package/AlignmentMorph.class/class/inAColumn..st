instance creation
inAColumn: aCollectionOfMorphs 
	"Answer a columnar AlignmentMorph holding the given collection"
	| _gsSqueakTemp_col |
	_gsSqueakTemp_col := self newColumn color: Color transparent;
				 vResizing: #shrinkWrap;
				 hResizing: #shrinkWrap;
				 layoutInset: 1;
				 borderColor: Color black;
				 borderWidth: 1;
				 wrapCentering: #center;
				 cellPositioning: #topCenter.
	aCollectionOfMorphs
		do: [:each | _gsSqueakTemp_col addMorphBack: each].
	^ _gsSqueakTemp_col