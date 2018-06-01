initialization
addActionsOffImage: offImage onImage: onImage 
	| _gsSqueakTemp_posSpec _gsSqueakTemp_actionSpec |
	_gsSqueakTemp_posSpec := #(#(53 53 53 53 ) #(154 178 202 226 ) #(39 39 39 39 ) #(23 23 23 23 ) ).
	"offset X"
	"offset Y"
	"width"
	"height"
	_gsSqueakTemp_actionSpec := #(#undo:with:evt: #keep:with:evt: #clear:with:evt: #toss:with:evt: ).
	#(#undo: #keep: #clear: #toss: )
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
						
						bounds: (rect translateBy: self position);
						 setNamePropertyTo: name;
						
						actionSelector: (_gsSqueakTemp_actionSpec at: index);
						
						arguments: (Array with: button with: name);
						 actWhen: #buttonUp;
						 target: self.
					self addMorph: button]]