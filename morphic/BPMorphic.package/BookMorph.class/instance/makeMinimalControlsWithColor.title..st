other
makeMinimalControlsWithColor: aColor title: aString 
	| _gsSqueakTemp_aButton _gsSqueakTemp_aColumn _gsSqueakTemp_aRow _gsSqueakTemp_but |
	_gsSqueakTemp_aButton := SimpleButtonMorph new target: self;
				 borderColor: Color black;
				 color: aColor;
				 borderWidth: 0.
	_gsSqueakTemp_aColumn := AlignmentMorph newColumn.
	_gsSqueakTemp_aColumn color: _gsSqueakTemp_aButton color;
		 borderWidth: 0;
		 layoutInset: 0.
	_gsSqueakTemp_aColumn hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	_gsSqueakTemp_aRow := AlignmentMorph newRow.
	_gsSqueakTemp_aRow color: _gsSqueakTemp_aButton color;
		 borderWidth: 0;
		 layoutInset: 0.
	_gsSqueakTemp_aRow hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	_gsSqueakTemp_aRow addTransparentSpacerOfSize: 40 @ 0.
	_gsSqueakTemp_aRow addMorphBack: (_gsSqueakTemp_but := _gsSqueakTemp_aButton label: ' < ';
					 actionSelector: #previousPage).
	"copy is OK, since we just made it and it can't own any Players"
	_gsSqueakTemp_but setBalloonText: 'Go to previous page'.
	_gsSqueakTemp_aRow addTransparentSpacerOfSize: 82 @ 0.
	_gsSqueakTemp_aRow addMorphBack: (StringMorph contents: aString) lock.
	_gsSqueakTemp_aRow addTransparentSpacerOfSize: 82 @ 0.
	_gsSqueakTemp_aButton := SimpleButtonMorph new target: self;
				 borderColor: Color black;
				 color: aColor;
				 borderWidth: 0.
	_gsSqueakTemp_aRow addMorphBack: (_gsSqueakTemp_but := _gsSqueakTemp_aButton label: ' > ';
					 actionSelector: #nextPage).
	_gsSqueakTemp_but setBalloonText: 'Go to next page'.
	_gsSqueakTemp_aRow addTransparentSpacerOfSize: 40 @ 0.
	_gsSqueakTemp_aColumn addMorphBack: _gsSqueakTemp_aRow.
	_gsSqueakTemp_aColumn setNameTo: 'Page Controls'.
	^ _gsSqueakTemp_aColumn