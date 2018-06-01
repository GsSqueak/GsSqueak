initialization
addToolsOffImage: offImage onImage: onImage 
	| _gsSqueakTemp_posSpec _gsSqueakTemp_actionSpec _gsSqueakTemp_iconSpec |
	_gsSqueakTemp_posSpec := #(#(13 53 13 53 ) #(13 13 61 61 ) #(40 40 40 40 ) #(48 48 44 44 ) ).
	"offset X"
	"offset Y"
	"width"
	"height"
	_gsSqueakTemp_actionSpec := #(#tool:action:cursor:evt: #tool:action:cursor:evt: #eyedropper:action:cursor:evt: #tool:action:cursor:evt: ).
	_gsSqueakTemp_iconSpec := #(#paintIcon #fillIcon #eyedropperIcon #eraseIcon ).
	#(#paint: #fill: #eyedropper: #erase: )
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
						
						arguments: (Array
								with: button
								with: name
								with: (self class
										perform: (_gsSqueakTemp_iconSpec at: index)));
						 actWhen: #buttonUp;
						 target: self.
					index = 1
						ifTrue: [action := name.
							tool := button.
							currentCursor := button arguments at: 3].
					self addMorph: button]]