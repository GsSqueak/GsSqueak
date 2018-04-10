miscellaneous
paintFlapButton
	"Answer a button to serve as the paint flap"
	| _gsSqueakTemp_pb _gsSqueakTemp_oldArgs _gsSqueakTemp_brush _gsSqueakTemp_myButton _gsSqueakTemp_m |
	_gsSqueakTemp_pb := PaintBoxMorph new submorphNamed: #paint:.
	_gsSqueakTemp_pb
		ifNil: [(_gsSqueakTemp_brush := Form extent: 16 @ 16 depth: 16) fillColor: Color red]
		ifNotNil: [_gsSqueakTemp_oldArgs := _gsSqueakTemp_pb arguments.
			_gsSqueakTemp_brush := _gsSqueakTemp_oldArgs third.
			_gsSqueakTemp_brush := _gsSqueakTemp_brush
						copy: (2 @ 0 extent: 42 @ 38).
			_gsSqueakTemp_brush := _gsSqueakTemp_brush scaledToSize: _gsSqueakTemp_brush extent // 2].
	_gsSqueakTemp_myButton := BorderedMorph new.
	_gsSqueakTemp_myButton
		color: (Color
				r: 0.833
				g: 0.5
				b: 0.0);
		 borderWidth: 2;
		 borderColor: #raised.
	_gsSqueakTemp_myButton addMorph: (_gsSqueakTemp_m := _gsSqueakTemp_brush asMorph lock).
	_gsSqueakTemp_myButton extent: _gsSqueakTemp_m extent + (_gsSqueakTemp_myButton borderWidth + 6).
	_gsSqueakTemp_m position: _gsSqueakTemp_myButton center - (_gsSqueakTemp_m extent // 2).
	^ _gsSqueakTemp_myButton