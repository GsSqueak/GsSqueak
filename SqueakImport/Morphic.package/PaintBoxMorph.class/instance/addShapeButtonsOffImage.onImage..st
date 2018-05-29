initialization
addShapeButtonsOffImage: offImage onImage: onImage
	| shapes posSpec iconSpec |
	posSpec := #(
		(17 17 17 17 17) "offset X"
		(0 22 44 66 88) "offset Y"
		(30 30 30 30 30) "width"
		(21 21 21 21 21) "height").
	shapes := self submorphNamed: 'shapes'.
	iconSpec := #(lineIcon rectIcon ellipseIcon polygonIcon starIcon).
	#(line: rect: ellipse: polygon: star:) keysAndValuesDo: [:index :name |
		| button rect |
		(self submorphNamed: name) ifNil:
			[rect := ((posSpec at: 1) at: index) @ ((posSpec at: 2) at: index)
					extent: ((posSpec at: 3) at: index) @ ((posSpec at: 4) at: index).
			(button := ThreePhaseButtonMorph new)
				onImage: (onImage copy: rect);
				offImage: (offImage copy: rect);
				pressedImage: (onImage copy: rect);
				bounds: (rect translateBy: shapes position);
				setNamePropertyTo: name;
				actionSelector: #tool:action:cursor:evt:; 
					arguments: (Array with: button with: name with: (self class perform: (iconSpec at: index)));
				actWhen: #buttonUp; target: self.
			shapes addMorph: button.]].