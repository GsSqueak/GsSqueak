initialization
addActionsOffImage: offImage onImage: onImage
	| posSpec actionSpec |
	posSpec := #(
		(53 53 53 53) "offset X"
		(154 178 202 226) "offset Y"
		(39 39 39 39) "width"
		(23 23 23 23) "height").
	actionSpec := #(undo:with:evt: keep:with:evt: clear:with:evt: toss:with:evt:).
	#(undo: keep: clear: toss:) keysAndValuesDo: [:index :name |
		| button rect |
		(self submorphNamed: name) ifNil:
			[rect := ((posSpec at: 1) at: index) @ ((posSpec at: 2) at: index)
					extent: ((posSpec at: 3) at: index) @ ((posSpec at: 4) at: index).
			(button := ThreePhaseButtonMorph new)
				onImage: (onImage copy: rect);
				offImage: (offImage copy: rect);
				pressedImage: (onImage copy: rect);
				bounds: (rect translateBy: self position);
				setNamePropertyTo: name;
				actionSelector: (actionSpec at: index); 
					arguments: (Array with: button with: name);
				actWhen: #buttonUp; target: self.
			self addMorph: button.]].