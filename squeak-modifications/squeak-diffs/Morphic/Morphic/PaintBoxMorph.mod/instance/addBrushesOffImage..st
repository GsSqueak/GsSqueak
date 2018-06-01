initialization
addBrushesOffImage: offImage
	| posSpec |
	posSpec := #(
		(13 37 64 13 37 64) "offset X"
		(107 107 107 124 124 124) "offset Y"
		(21 24 27 21 24 27) "width"
		(18 18 18 25 25 25) "height").
	#(brush1: brush2: brush3: brush4: brush5: brush6: ) keysAndValuesDo: [:index :name |
		| button nib rect on off |
		(self submorphNamed: name) ifNil:
			[nib := Form dotOfSize: (#(1 2 3 6 11 26) at: index).
			rect := ((posSpec at: 1) at: index) @ ((posSpec at: 2) at: index)
					extent: ((posSpec at: 3) at: index) @ ((posSpec at: 4) at: index).
			off := (offImage copy: rect) as8BitColorForm.
			"highlight a frame"
			on := off deepCopy.
			(on getCanvas copyOrigin: 0@0 clipRect: (0@0 extent: rect extent))
				frameAndFillRectangle: (0@0 extent: rect extent) fillColor: Color transparent
				borderWidth: 2 borderColor: (Color r: 0.6 g: 0.8 b: 1.0).
			(button := ThreePhaseButtonMorph new)
				onImage: on;
				offImage: off;
				pressedImage: on;
				bounds: (rect translateBy: self position);
				setNamePropertyTo: name;
				actionSelector: #brush:action:nib:evt:; 
					arguments: (Array with: button with: name with: nib);
				actWhen: #buttonUp; target: self.
			self addMorph: button.]].
	brushes := #(brush1: brush2: brush3: brush4: brush5: brush6: ) collect: [:name | self submorphNamed: name].
	currentBrush := brushes at: 3.
	currentBrush state: #on.

