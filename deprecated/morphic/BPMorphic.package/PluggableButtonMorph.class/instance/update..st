updating
update: aParameter 
	getLabelSelector
		ifNotNil: [:sel | aParameter == sel
				ifTrue: [self
						label: (model perform: sel)]].
	getStateSelector
		ifNotNil: [:sel | aParameter == sel
				ifTrue: [self updateFillStyle]]