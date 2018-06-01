initialization
addStampButtonsOffImage: offImage onImage: onImage 
	| _gsSqueakTemp_stamps _gsSqueakTemp_posSpec _gsSqueakTemp_actionSpec _gsSqueakTemp_argSpec _gsSqueakTemp_names |
	_gsSqueakTemp_posSpec := #(#(13 38 63 13 38 63 37 55 ) #(0 0 0 25 25 25 51 51 ) #(25 25 25 25 25 25 15 15 ) #(25 25 25 25 25 25 15 15 ) ).
	"offset X"
	"offset Y"
	"width"
	"height"
	_gsSqueakTemp_actionSpec := #(#pickup:action:cursor:evt: #pickup:action:cursor:evt: #pickup:action:cursor:evt: #pickup:action:cursor:evt: #pickup:action:cursor:evt: #pickup:action:cursor:evt: #scrollStamps:action:evt: #scrollStamps:action:evt: ).
	_gsSqueakTemp_argSpec := #(#stamp: #stamp: #stamp: #stamp: #stamp: #stamp: #prevStamp: #nextStamp: ).
	_gsSqueakTemp_names := #(#pickup: #pickup: #pickup: #stamp: #stamp: #stamp: #prevStamp: #nextStamp: ).
	_gsSqueakTemp_stamps := self submorphNamed: 'stamps'.
	_gsSqueakTemp_names
		keysAndValuesDo: [:index :name | | button rect | (self submorphNamed: name)
				ifNil: [rect := ((_gsSqueakTemp_posSpec at: 1)
								at: index)
								@ ((_gsSqueakTemp_posSpec at: 2)
										at: index) extent: ((_gsSqueakTemp_posSpec at: 3)
									at: index)
									@ ((_gsSqueakTemp_posSpec at: 4)
											at: index).
					(button := ThreePhaseButtonMorph new)
						onImage: (onImage copy: rect);
						
						offImage: (offImage copy: rect);
						
						pressedImage: (onImage copy: rect);
						
						bounds: (rect translateBy: _gsSqueakTemp_stamps position);
						 setNamePropertyTo: name;
						
						actionSelector: (_gsSqueakTemp_actionSpec at: index);
						
						arguments: ((Array
								with: button
								with: (_gsSqueakTemp_argSpec at: index)
								with: Cursor origin)
								first: (_gsSqueakTemp_actionSpec at: index) numArgs - 1);
						 actWhen: #buttonUp;
						 target: self.
					_gsSqueakTemp_stamps addMorph: button]]