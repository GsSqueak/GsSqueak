instance creation
columnPrototype
	"Answer a prototypical column"
	| _gsSqueakTemp_sampleMorphs _gsSqueakTemp_aColumn |
	_gsSqueakTemp_sampleMorphs := #(#red #yellow #green )
				collect: [:aColor | Morph new extent: 130 @ 38;
						
						color: (Color perform: aColor);
						 setNameTo: aColor asString;
						 yourself].
	_gsSqueakTemp_aColumn := self inAColumn: _gsSqueakTemp_sampleMorphs.
	_gsSqueakTemp_aColumn setNameTo: 'Column'.
	_gsSqueakTemp_aColumn color: Color veryVeryLightGray.
	_gsSqueakTemp_aColumn cellInset: 4;
		 layoutInset: 6.
	_gsSqueakTemp_aColumn enableDragNDrop.
	_gsSqueakTemp_aColumn setBalloonText: 'Things dropped into here will automatically be organized into a column. Once you have added your own items here, you will want to remove the sample colored rectangles that this started with, and you will want to change this balloon help message to one of your own!' translated.
	^ _gsSqueakTemp_aColumn