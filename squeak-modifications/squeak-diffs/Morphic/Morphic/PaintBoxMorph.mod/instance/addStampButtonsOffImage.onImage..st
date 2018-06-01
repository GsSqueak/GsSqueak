initialization
addStampButtonsOffImage: offImage onImage: onImage
	| stamps posSpec actionSpec argSpec names |
	posSpec := #(
		(13 38 63 13 38 63 37 55) "offset X"
		(0 0 0 25 25 25 51 51) "offset Y"
		(25 25 25 25 25 25 15 15) "width"
		(25 25 25 25 25 25 15 15) "height").
	actionSpec := #(
		pickup:action:cursor:evt: pickup:action:cursor:evt: pickup:action:cursor:evt:
		pickup:action:cursor:evt: pickup:action:cursor:evt: pickup:action:cursor:evt:
		scrollStamps:action:evt: scrollStamps:action:evt:).
	argSpec := #(
		stamp: stamp: stamp:
		stamp: stamp: stamp:
		prevStamp: nextStamp:).
	names := #(
		pickup: pickup: pickup:
		stamp: stamp: stamp:
		prevStamp: nextStamp:).
	stamps := self submorphNamed: 'stamps'.
	names keysAndValuesDo: [:index :name |
		| button rect |
		(self submorphNamed: name) ifNil:
			[rect := ((posSpec at: 1) at: index) @ ((posSpec at: 2) at: index)
					extent: ((posSpec at: 3) at: index) @ ((posSpec at: 4) at: index).
			(button := ThreePhaseButtonMorph new)
				onImage: (onImage copy: rect);
				offImage: (offImage copy: rect);
				pressedImage: (onImage copy: rect);
				bounds: (rect translateBy: stamps position);
				setNamePropertyTo: name;
				actionSelector: (actionSpec at: index); 
					arguments: ((Array with: button with: (argSpec at: index) with: Cursor origin) first: (actionSpec at: index) numArgs - 1);
				actWhen: #buttonUp; target: self.
			stamps addMorph: button.]].