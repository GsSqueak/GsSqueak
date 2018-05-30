drawing
drawOn: aCanvas

	| font projectName nameForm rectForName |

	self ensureImageReady.
	super drawOn: aCanvas.
	self isEditingName ifTrue: [^self].

	font := self fontForName.
	projectName := self safeProjectName.
	nameForm := (StringMorph contents: projectName font: font) imageForm.
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
		drawImage: nameForm 
		at: rectForName topLeft
