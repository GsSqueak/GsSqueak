change reporting
addHandleForColor: aColor position: aPosition
	| handleInstance colorIcon delta |
	handleInstance := self handle.
	colorIcon := SketchMorph
						withForm: ((aColor iconOrThumbnailOfSize: 20) borderWidth: 1 color: Color black)..
	self eventHandler: colorIcon target: colorIcon.
	self eventHandler: handleInstance target: self.
	row addMorph: handleInstance.
	delta := gradientDisplay left - 10 + (gradientDisplay width * aPosition).
	handleInstance position:  delta @ (gradientDisplay top - 18).
	colorIcon position: delta @ (gradientDisplay bottom + 5).
	handleInstance addMorph: colorIcon.
	rampMorphs addLast: handleInstance.
	
	