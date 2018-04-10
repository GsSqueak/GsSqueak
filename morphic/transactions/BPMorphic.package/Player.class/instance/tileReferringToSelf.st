misc
tileReferringToSelf
	"answer a tile that refers to the receiver"
	| _gsSqueakTemp_aTile _gsSqueakTemp_nn _gsSqueakTemp_tile |
	Preferences universalTiles
		ifTrue: [_gsSqueakTemp_nn := self externalName.
			"name it, if necessary, and put in References"
			(References includesKey: _gsSqueakTemp_nn asSymbol)
				ifFalse: [References at: _gsSqueakTemp_nn asSymbol put: self].
			_gsSqueakTemp_tile := SyntaxMorph new
						parseNode: (VariableNode new
								name: _gsSqueakTemp_nn
								key: _gsSqueakTemp_nn
								code: nil).
			_gsSqueakTemp_tile layoutInset: 1;
				
				addMorph: (_gsSqueakTemp_tile addString: _gsSqueakTemp_nn special: false).
			_gsSqueakTemp_tile
				color: (SyntaxMorph translateColor: #variable).
			_gsSqueakTemp_tile extent: _gsSqueakTemp_tile firstSubmorph extent + (2 @ 2).
			^ _gsSqueakTemp_tile].
	_gsSqueakTemp_aTile := TileMorph new setToReferTo: self.
	_gsSqueakTemp_aTile updateWordingToMatchVocabulary.
	^ _gsSqueakTemp_aTile