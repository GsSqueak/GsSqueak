instance creation
inARow: aCollectionOfMorphs 
	"Answer a row-oriented AlignmentMorph holding the given collection"
	| _gsSqueakTemp_aRow |
	_gsSqueakTemp_aRow := self newRow color: Color transparent;
				 vResizing: #shrinkWrap;
				 hResizing: #shrinkWrap;
				 layoutInset: 1;
				 borderColor: Color black;
				 borderWidth: 1;
				 wrapCentering: #center;
				 cellPositioning: #topCenter.
	aCollectionOfMorphs
		do: [:each | _gsSqueakTemp_aRow addMorphBack: each].
	^ _gsSqueakTemp_aRow