drawing
drawOn: aCanvas

	| font stringToShow nameForm rectForName |

	super drawOn: aCanvas.
	self isEditingName ifTrue: [^self].

	font := self fontForName.
	stringToShow := self stringToShow.
	nameForm := (StringMorph contents: stringToShow font: font) imageForm.
	nameForm := nameForm scaledToSize: (self extent - (4@2) min: nameForm extent).
	rectForName := self bottomLeft + 
			(self width - nameForm width // 2 @ (nameForm height + 2) negated)
				extent: nameForm extent.
	rectForName topLeft eightNeighbors do: [ :pt |
		aCanvas
			stencil: nameForm 
			at: pt
			color: self colorAroundName.
	].
	aCanvas
		stencil: nameForm 
		at: rectForName topLeft 
		color: Color black.


	
