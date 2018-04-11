initialization
addShapeButtonsOffImage: offImage onImage: onImage 
	| _gsSqueakTemp_shapes _gsSqueakTemp_posSpec _gsSqueakTemp_iconSpec |
	_gsSqueakTemp_posSpec := #(#(17 17 17 17 17 ) #(0 22 44 66 88 ) #(30 30 30 30 30 ) #(21 21 21 21 21 ) ).
	"offset X"
	"offset Y"
	"width"
	"height"
	_gsSqueakTemp_shapes := self submorphNamed: 'shapes'.
	_gsSqueakTemp_iconSpec := #(#lineIcon #rectIcon #ellipseIcon #polygonIcon #starIcon ).
	#(#line: #rect: #ellipse: #polygon: #star: )
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
						
						bounds: (rect translateBy: _gsSqueakTemp_shapes position);
						 setNamePropertyTo: name;
						 actionSelector: #tool:action:cursor:evt:;
						
						arguments: (Array
								with: button
								with: name
								with: (self class
										perform: (_gsSqueakTemp_iconSpec at: index)));
						 actWhen: #buttonUp;
						 target: self.
					_gsSqueakTemp_shapes addMorph: button]]