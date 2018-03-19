instance creation
rowPrototype
	"Answer a prototypical row"
	| _gsSqueakTemp_sampleMorphs _gsSqueakTemp_aRow |
	_gsSqueakTemp_sampleMorphs := (1 to: 2 + 3 atRandom)
				collect: [:integer | EllipseMorph new extent: 60 + 20 atRandom @ (80 + 20 atRandom);
						 color: Color random;
						 setNameTo: 'egg' , integer asString;
						 yourself].
	_gsSqueakTemp_aRow := self inARow: _gsSqueakTemp_sampleMorphs.
	_gsSqueakTemp_aRow setNameTo: 'Row'.
	_gsSqueakTemp_aRow enableDragNDrop.
	_gsSqueakTemp_aRow cellInset: 6.
	_gsSqueakTemp_aRow layoutInset: 8.
	_gsSqueakTemp_aRow setBalloonText: 'Things dropped into here will automatically be organized into a row. Once you have added your own items here, you will want to remove the sample colored eggs that this started with, and you will want to change this balloon help message to one of your own!' translated.
	_gsSqueakTemp_aRow color: Color veryVeryLightGray.
	^ _gsSqueakTemp_aRow"AlignmentMorph rowPrototype openInHand"