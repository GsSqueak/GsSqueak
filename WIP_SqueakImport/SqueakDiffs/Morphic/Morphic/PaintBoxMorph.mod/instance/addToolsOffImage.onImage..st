initialization
addToolsOffImage: offImage onImage: onImage
	| posSpec actionSpec iconSpec |
	posSpec := #(
		(13 53 13 53) "offset X"
		(13 13 61 61) "offset Y"
		(40 40 40 40) "width"
		(48 48 44 44) "height").
	actionSpec := #(tool:action:cursor:evt: tool:action:cursor:evt: eyedropper:action:cursor:evt: tool:action:cursor:evt:).
	iconSpec := #(paintIcon fillIcon eyedropperIcon eraseIcon).
	#(paint: fill: eyedropper: erase:) keysAndValuesDo: [:index :name |
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
					arguments: (Array with: button with: name with: (self class perform: (iconSpec at: index)));
				actWhen: #buttonUp; target: self.
			index = 1
				ifTrue:
					[action := name.
					tool := button.
					currentCursor := button arguments at: 3].
			self addMorph: button.]].

