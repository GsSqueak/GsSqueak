menu
changeMargins: evt 
	| _gsSqueakTemp_handle _gsSqueakTemp_origin _gsSqueakTemp_aHand _gsSqueakTemp_oldMargin _gsSqueakTemp_newMargin |
	_gsSqueakTemp_aHand := evt
				ifNil: [self primaryHand]
				ifNotNil: [evt hand].
	_gsSqueakTemp_origin := _gsSqueakTemp_aHand position.
	_gsSqueakTemp_oldMargin := margins.
	(_gsSqueakTemp_handle := HandleMorph new)
		forEachPointDo: [:newPoint | 
			_gsSqueakTemp_handle removeAllMorphs.
			_gsSqueakTemp_handle
				addMorph: (LineMorph
						from: _gsSqueakTemp_origin
						to: newPoint
						color: Color black
						width: 1).
			_gsSqueakTemp_newMargin := (newPoint - _gsSqueakTemp_origin max: 0 @ 0)
						// 5.
			self margins: _gsSqueakTemp_newMargin]
		lastPointDo: [:newPoint | 
			_gsSqueakTemp_handle deleteBalloon.
			self halo
				ifNotNil: [:halo | halo addHandles].
			self rememberCommand: (Command new cmdWording: 'margin change for ' translated , self nameForUndoWording;
					
					undoTarget: self
					selector: #margins:
					argument: _gsSqueakTemp_oldMargin;
					
					redoTarget: self
					selector: #margins:
					argument: _gsSqueakTemp_newMargin;
					 yourself)].
	_gsSqueakTemp_aHand attachMorph: _gsSqueakTemp_handle.
	_gsSqueakTemp_handle setProperty: #helpAtCenter toValue: true.
	_gsSqueakTemp_handle showBalloon: 'Move cursor down and to the right
to increase margin inset.
Click when done.' hand: evt hand.
	_gsSqueakTemp_handle startStepping